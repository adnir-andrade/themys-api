class AddCampaignsPlayerToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_reference :characters, :campaigns_player, null: false, foreign_key: true
  end
end
