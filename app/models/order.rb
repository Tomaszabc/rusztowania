# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :send_email

  attribute :storage_info, :text
  attribute :name, :string

  has_many :order_lists, dependent: :destroy
  has_many :parts, through: :order_lists
  belongs_to :user, -> { with_deleted }
  has_many :order_storage_lists, dependent: :destroy

  validates :building_site, presence: true
  validates :delivery_date, presence: true

  after_initialize :set_default_status, if: :new_record?

  accepts_nested_attributes_for :order_lists

  enum status: { pending: 'Pending', in_progress: 'In Progress', completed: 'Completed',
                 missing_parts: 'Missing Parts' }

  def set_default_status
    self.status ||= 'pending'
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[car_number building_site created_at delivery_date id info part_description part_number
       quantity updated_at weight user_id building_site_info status storage_info new_delivery_date hidden]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[order_lists parts order_storage_lists]
  end

  def delivery_date_cannot_be_in_the_past
    return unless delivery_date.present? && delivery_date < Date.today

    errors.add(:delivery_date, "can't be in the past")
  end

  def total_weight
    order_lists.sum { |list| list.part ? list.quantity * list.part.weight : 0 }
  end

  def set_to_hide
    self.hidden = true
    save
  end

  def set_to_visible
    self.hidden = false
    save
  end

  def recipients_emails(current_user)
    mailer_emails = { 'Scaffolder' => user.email }
    site = Site.find_by(name: building_site)
    mailer_emails['Site Ledermann'] = site.ledermann.email if site&.ledermann.present?
    mailer_emails['Your Email'] = current_user.email
    DeliveryEmail.pluck(:recipient_email).each_with_index do |email, index|
      mailer_emails["Email #{index + 1}"] = email
    end
    mailer_emails.uniq
  end
end
