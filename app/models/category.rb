# frozen_string_literal: true

class Category < ApplicationRecord
  acts_as_paranoid

  has_many :part_categories
  has_many :parts, through: :part_categories

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[part_categories parts]
  end
end
