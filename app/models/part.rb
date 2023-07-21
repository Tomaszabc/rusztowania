class Part < ApplicationRecord
  has_many :order_lists
  has_many :orders, through: :order_lists
  has_one_attached :image
  
  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "id", "multipack", "name", "system", "updated_at", "weight"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "orders"]
  end
end
