class ChangeCampaignsPlayerIdInCharacters < ActiveRecord::Migration[7.1]
  def change
    change_column_null :characters, :campaigns_player_id, true
  end
end
