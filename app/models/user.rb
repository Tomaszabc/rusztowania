# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :status, inclusion: { in: %w[scaffolder admin lagermann] }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email encrypted_password id remember_created_at reset_password_sent_at
       reset_password_token updated_at username name status]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['orders']
  end

  def display_name
    email
  end

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
