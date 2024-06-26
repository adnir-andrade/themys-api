class CampaignsPlayer < ApplicationRecord
  belongs_to :campaign
  belongs_to :player, class_name: 'User'
  belongs_to :character, optional: true
end
