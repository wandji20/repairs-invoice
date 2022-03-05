require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { create(:user) }

  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
end
