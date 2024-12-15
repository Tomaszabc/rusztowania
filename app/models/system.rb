# frozen_string_literal: true

class System < ApplicationRecord
  acts_as_paranoid

  has_many :part_systems
  has_many :parts, through: :part_systems
  has_many :categories, through: :parts

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[part_systems parts]
  end
end
