require 'rails_helper'

RSpec.describe Property, type: :model do

  let!(:user) { create(:user) }

  it 'has a valid factory' do
    expect(build(:property)).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:key_features) }
    it { should have_attached_file(:floor_plan) }
    it { should validate_attachment_content_type(:floor_plan).
        allowing('image/png', 'image/gif').
        rejecting('text/plain', 'text/xml') }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:property_images).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

end
