# frozen_string_literal: true

class PartSystem < ApplicationRecord
  belongs_to :part
  belongs_to :system

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id part_id system_id updated_at]
  end
end
