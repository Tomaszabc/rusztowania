class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :status, inclusion: { in: %w[scaffolder admin lagermann] }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username", "name", "status"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["orders"]
  end

  def display_name
    self.email 
  end

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
  
end
