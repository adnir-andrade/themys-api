class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.references :player, foreign_key: { to_table: :users }
      t.string :name
      t.integer :level
      t.string :gender
      t.string :race
      t.string :first_class
      t.integer :first_class_level
      t.string :second_class
      t.integer :second_class_level
      t.string :subclass
      t.string :background
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :max_hp
      t.integer :current_hp

      t.timestamps
    end
  end
end
