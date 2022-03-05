require 'rails_helper'

RSpec.describe Part, type: :model do
  let(:subject) { create(:part) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:total) }
  it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }
end
