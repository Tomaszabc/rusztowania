class Order < ApplicationRecord
  # Asocjacje
  # has_many :order_items
  has_many :order_lists
  has_many :parts, through: :order_lists

  
  validates :building_site, :delivery_date, presence: true
  

  def self.ransackable_attributes(auth_object = nil)
    ["building_site", "created_at", "delivery_date", "id", "info", "part_description", "part_number", "quantity", "updated_at", "weight"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "parts"]
  end

  
end
