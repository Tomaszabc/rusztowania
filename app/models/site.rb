class Site < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "name", "updated_at"]
  end

end
