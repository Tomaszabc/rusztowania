class Part < ApplicationRecord
  has_many :order_lists
  has_many :orders, through: :order_lists
  has_one_attached :image

  validates :name, :description, :category, :multipack, :system, :weight, presence: true
  validates :name, uniqueness: true
  validates :system, inclusion: { in: ["peri", "haki", "rullestias", "combisafe", "alfix", "other"] }
  validates :weight, comparison: { greater_than_or_equal_to: 0.0 }
  
  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "id", "multipack", "name", "system", "updated_at", "weight", "image_attachment_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "orders"]
  end
end
