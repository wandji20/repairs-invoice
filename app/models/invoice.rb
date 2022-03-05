class Invoice < ApplicationRecord
  belongs_to :user, optional: false

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  enum status: {
    pending: 0, approved: 0, decline: 3
  }

  has_many :invoice_items

  accepts_nested_attributes_for(:invoice_items)
end
