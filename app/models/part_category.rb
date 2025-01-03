# frozen_string_literal: true

class PartCategory < ApplicationRecord
  belongs_to :part
  belongs_to :category

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at id part_id updated_at]
  end
end
