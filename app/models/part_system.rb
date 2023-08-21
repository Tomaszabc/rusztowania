class PartSystem < ApplicationRecord
  belongs_to :part
  belongs_to :system

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "part_id", "system_id", "updated_at"]
  end

end
