class AddCharacterToCampaignsPlayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :campaigns_players, :character, foreign_key: { to_table: :characters }
  end
end
