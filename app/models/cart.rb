class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :parts, through: :cart_items
end
