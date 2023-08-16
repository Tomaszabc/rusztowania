class OrderStorageList < ApplicationRecord
  belongs_to :order
  belongs_to :part


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "updated_at", "weight", "quantity", "description"]
  end

end
