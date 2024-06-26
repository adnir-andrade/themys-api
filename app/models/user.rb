class User < ApplicationRecord
    has_many :campaigns_as_dm, class_name: 'Campaign', foreign_key: 'dm_id'
    has_many :campaigns_players
    has_many :campaigns_as_player, through: :campaigns_players, source: :campaign
end
