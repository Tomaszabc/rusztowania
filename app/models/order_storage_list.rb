# frozen_string_literal: true

class OrderStorageList < ApplicationRecord
  belongs_to :order
  belongs_to :part

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id updated_at weight quantity description]
  end
end
