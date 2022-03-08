class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  has_many :invoices, dependent: :nullify
  has_secure_password

  scope :by_username, -> { where(admin: false).order(:username) }
end
