class Part < ApplicationRecord
  has_many :order_lists
  has_many :orders, through: :order_lists

  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "id", "image", "multipack", "name", "system", "updated_at", "weight"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "orders"]
  end
end
