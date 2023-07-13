class Order < ApplicationRecord
  # Asocjacje
  has_many :order_items

  # Walidacje
  validates :building_site, :delivery_date, presence: true
  # Dodaj inne walidacje według potrzeb
end
