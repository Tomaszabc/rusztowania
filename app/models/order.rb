class Order < ApplicationRecord
  attribute :storage_info, :text
  attribute :name, :string
  
  has_many :order_lists, dependent: :destroy
  has_many :parts, through: :order_lists
  belongs_to :user
  has_many :order_storage_lists, dependent: :destroy
  
  validates :building_site, presence: true
  validates :delivery_date, presence: true
  

  

  after_initialize :set_default_status, if: :new_record?

  accepts_nested_attributes_for :order_lists

  enum status: { pending: 'Pending', in_progress: 'In Progress', completed: 'Completed', missing_parts: "Missing Parts" }

  def set_default_status
    self.status ||= "pending"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["car_number", "building_site", "created_at", "delivery_date", "id", "info", "part_description", "part_number", "quantity", "updated_at", "weight", "user_id", "building_site_info", "status", "storage_info", "new_delivery_date", "hidden"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "parts", "order_storage_lists"]
  end

  def delivery_date_cannot_be_in_the_past
    if delivery_date.present? && delivery_date < Date.today
      errors.add(:delivery_date, "can't be in the past")
    end
  end
  
  def total_weight
    order_lists.sum { |list| list.quantity * list.part.weight }
  end


  def set_to_hide
    self.hidden = true
    save
  end

  def set_to_visible
    self.hidden = false
    save
  end
  
end
