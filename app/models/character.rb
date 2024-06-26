class Character < ApplicationRecord
  belongs_to :player, class_name: 'User', foreign_key: 'player_id'
  belongs_to :campaigns_player
  has_one :inventory
end
