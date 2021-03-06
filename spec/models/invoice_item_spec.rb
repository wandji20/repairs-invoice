require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
  it { should belong_to(:invoice) }
  it { should belong_to(:part) }
end
