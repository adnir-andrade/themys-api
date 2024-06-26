class CreateCampaignsPlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns_players do |t|
      t.references :player, foreign_key: { to_table: :users }
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
