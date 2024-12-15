# frozen_string_literal: true

class Part < ApplicationRecord
  acts_as_paranoid

  has_many :order_lists
  has_many :orders, through: :order_lists
  has_one_attached :image

  has_many :part_systems
  has_many :systems, through: :part_systems

  has_many :part_categories
  has_many :categories, through: :part_categories

  validates :name, :description, :multipack, :weight, presence: true
  validates :name, uniqueness: true
  validates :weight, comparison: { greater_than_or_equal_to: 0.0 }
  validate :validate_image_format
  validate :image_size_under_15_mb

  def name_with_description
    "#{name}, #{description}"
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[category created_at description id multipack name system updated_at weight
       image_attachment_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[order_lists orders part_systems part_categories]
  end

  private

  def validate_image_format
    return unless image.attached?

    return if image.content_type.in?(%w[image/jpeg image/png image/gif])

    errors.add(:image, 'must be a JPEG, PNG, or GIF')
  end

  def image_size_under_15_mb
    return unless image.attached? && image.blob.byte_size > 15.megabytes

    errors.add(:image, 'is too large, must be under 15MB')
  end
end
