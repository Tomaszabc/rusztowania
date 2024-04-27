class PartCategory < ApplicationRecord
  belongs_to :part
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "part_id", "updated_at"]
  end
end
