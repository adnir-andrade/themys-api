class Inventory < ApplicationRecord
  belongs_to :character
  has_many :items, through: :items_stack
  has_many :items_stack
end
