class CartItem < ApplicationRecord
  belongs_to :part
  belongs_to :cart

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
end
