class CreateItemsStacks < ActiveRecord::Migration[7.1]
  def change
    create_table :items_stacks do |t|
      t.integer :quantity
      t.references :inventory, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
