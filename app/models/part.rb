class Part < ApplicationRecord
  has_many :order_lists
  has_many :orders, through: :order_lists
  has_one_attached :image

  has_many :part_systems
  has_many :systems, through: :part_systems

  has_many :part_categories
  has_many :categories, through: :part_categories

  validates :name, :description, :multipack, :weight, presence: true
  validates :name, uniqueness: true
  validates :weight, comparison: { greater_than_or_equal_to: 0.0 }
  
  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "description", "id", "multipack", "name", "system", "updated_at", "weight", "image_attachment_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_lists", "orders"]
  end
end
