class DeliveryEmail < ApplicationRecord
  has_many :orders
  
  def self.ransackable_associations(auth_object = nil)
    ["orders"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "recipient_email", "updated_at"]
  end

end