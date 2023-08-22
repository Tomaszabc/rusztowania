class OrderList < ApplicationRecord
  belongs_to :order
  belongs_to :part, -> { with_deleted }

  validates :delivery_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def self.ransackable_attributes(auth_object = nil)
    ["car_number", "created_at", "description", "id", "order_id", "part_id", "quantity", "updated_at", "weight"]
  end
end