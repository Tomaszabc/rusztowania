class OrderList < ApplicationRecord
  belongs_to :order
  belongs_to :part

  def self.ransackable_attributes(auth_object = nil)
    ["car_number", "created_at", "description", "id", "order_id", "part_id", "quantity", "updated_at", "weight"]
  end
end