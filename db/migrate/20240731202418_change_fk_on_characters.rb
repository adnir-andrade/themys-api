class ChangeFkOnCharacters < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :characters, :campaigns_players
    add_foreign_key :characters, :campaigns_players, on_delete: :nullify
  end
end
