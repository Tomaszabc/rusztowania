# frozen_string_literal: true

FactoryBot.define do
  factory :part do
    name { Faker::Commerce.unique.product_name }
    description { Faker::Commerce.unique.product_name }
    multipack { 1 }
    weight { 1.0 }
  end
end
