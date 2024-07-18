class TradesController < ApplicationController

  def create
    @trade_form = Trade::TradeForm.new(trade_params)

    if @trade_form.save
      render json: { message: 'Trade completed successfully' }, status: :created
    else
      render json: { errors: @trade_form.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:buyer_id, :seller_id, :item_id, :quantity)
  end
end
