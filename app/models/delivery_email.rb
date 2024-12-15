# frozen_string_literal: true

class DeliveryEmail < ApplicationRecord
  has_many :orders
  validates :recipient_email, presence: true, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    ['orders']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id recipient_email updated_at]
  end
end
