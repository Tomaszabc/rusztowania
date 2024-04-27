class System < ApplicationRecord
  acts_as_paranoid

  has_many :part_systems
  has_many :parts, through: :part_systems
  has_many :categories, through: :parts

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["part_systems", "parts"]
  end
end
