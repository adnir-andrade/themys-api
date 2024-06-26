class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.references :dm, foreign_key: { to_table: :users }
      t.string :name
      t.date :next_session

      t.timestamps
    end
  end
end
