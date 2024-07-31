class Campaign < ApplicationRecord
  belongs_to :dm, class_name: 'User', foreign_key: 'dm_id'
  has_many :campaigns_players, dependent: :destroy
  has_many :players, through: :campaigns_players, source: :player
end
