class Item < ApplicationRecord
  has_many :inventories, through: :items_stacks
  has_many :items_stacks
end
