class Category < ApplicationRecord
  acts_as_paranoid

  has_many :part_categories
  has_many :parts, through: :part_categories


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["part_categories", "parts"]
  end

end
