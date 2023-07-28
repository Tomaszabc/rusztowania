class Order < ApplicationRecord
  
  
  has_many :order_lists
  has_many :parts, through: :order_lists
  belongs_to :user
  
  validates :building_site, presence: true
  validates :delivery_date, presence: true
  validate :delivery_date_cannot_be_in_the_past

  def self.ransackable_attributes(auth_object = nil)
    ["car_number", "building_site", "created_at", "delivery_date", "id", "info", "part_description", "part_number", "quantity", "updated_at", "weight", "user_id", "building_site_info"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "parts"]
  end

  def delivery_date_cannot_be_in_the_past
    if delivery_date.present? && delivery_date < Date.today
      errors.add(:delivery_date, "can't be in the past")
    end
  end
  
  def total_weight
    order_lists.sum { |list| list.quantity * list.part.weight }
  end
end
