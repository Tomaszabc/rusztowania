class Site < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "name", "updated_at"]
  end

end
