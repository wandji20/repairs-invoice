require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_many(:invoice_items) }
end
