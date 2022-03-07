class InvoiceItem < ApplicationRecord
  before_save :set_subtotal

  belongs_to :part
  belongs_to :invoice

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  delegate :name, to: :part
  delegate :price, to: :part, prefix: 'unit'

  def set_subtotal
    self.subtotal = unit_price * quantity
  end
end
