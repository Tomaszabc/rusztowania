class CartItem < ApplicationRecord
  belongs_to :part
  belongs_to :cart
end
