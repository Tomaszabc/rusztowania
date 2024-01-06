FactoryBot.define do
  factory :cart_item do
    cart
    part
    quantity { 1 }
  end
end