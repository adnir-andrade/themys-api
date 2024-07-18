module Trade
  class TradeForm
    include ActiveModel::Model

    attr_accessor :buyer, :seller, :item_id, :quantity

    validates :buyer, :seller, :item_id, :quantity, presence: true
    validate :enough_items_in_entity_inventory

    def initialize(params)
      super
      @buyer = User.find(params[:buyer_id]) if params[:buyer_id]
      @seller = User.find(params[:seller_id]) if params[:seller_id]
      @source_inventory = buyer.inventory if buyer
      @target_inventory = seller.inventory if seller
    end

    def save
      return false unless valid?

      ItemsStack.transaction do
        transfer_item
        log_trade
      end

      return true
    rescue StandardError
      return false
    end

    private

    def enough_items_in_entity_inventory
      item_stack = @source_inventory.items_stacks.find_by(item_id: item_id)
      if item_stack.nil? || item_stack.quantity < quantity.to_i
        errors.add(:quantity, "not enough items in source inventory")
      end
    end

    def transfer_item
      source_item_stack = @source_inventory.items_stacks.find_by(item_id: item_id)
      target_item_stack = @target_inventory.items_stacks.find_or_initialize_by(item_id: item_id)

      source_item_stack.quantity -= quantity.to_i
      target_item_stack.quantity += quantity.to_i

      source_item_stack.save!
      target_item_stack.save!
    end

    def log_trade
      TradeLog.create!(
        buyer: buyer,
        seller: seller,
        item_id: item_id,
        quantity: quantity
      )
    end
  end
end