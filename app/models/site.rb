class Site < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true

  belongs_to :ledermann, class_name: 'User', optional: true

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "name", "updated_at", "ledermann_id"]
  end

end
