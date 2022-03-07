class Invoice < ApplicationRecord
  belongs_to :user, optional: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validate :invoice_items_count

  enum status: {
    pending: 0, approved: 0, decline: 3
  }

  has_many :invoice_items, dependent: :destroy

  accepts_nested_attributes_for :invoice_items,
                                allow_destroy: true,
                                reject_if: proc { |attr| attr['part_id'].blank? || attr['quantity'].blank? }

  private

  def invoice_items_count
    return if invoice_items.any?

    errors.add(
      :base, 'You cannot create an invoice without any items'
    )
  end
end
