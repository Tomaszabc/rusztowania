# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    building_site { 'Example Site' }
    delivery_date { Date.today }
    info { 'Some additional information' }
    part_number { '12345' }
    part_description { 'Sample part description' }
    quantity { 10 }
    weight { 15.5 }
    car_number { 'ABC123' }
    building_site_info { 'Additional site info' }
    new_delivery_date { Date.tomorrow }
    status { 'pending' }
    hidden { false }

    association :user, factory: :user
    # Użyj powyższej linii, jeśli model Order jest powiązany z User i masz fabrykę User.
  end
end
