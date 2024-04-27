class OrderStorageList < ApplicationRecord
  belongs_to :order
  belongs_to :part

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "updated_at", "weight", "quantity", "description"]
  end
end
