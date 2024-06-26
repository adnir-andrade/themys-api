class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :value
      t.float :weight

      t.timestamps
    end
  end
end
