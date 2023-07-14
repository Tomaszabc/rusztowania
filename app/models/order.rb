class Order < ApplicationRecord
  # Asocjacje
  has_many :order_items
  has_many :order_lists
  has_many :parts, through: :order_lists

  # Walidacje
  validates :building_site, :delivery_date, presence: true
  # Dodaj inne walidacje według potrzeb
end
