class Category < ApplicationRecord
  has_many :part_categories
  has_many :parts, through: :part_categories
end
