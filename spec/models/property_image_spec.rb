require 'rails_helper'

RSpec.describe PropertyImage, type: :model do

  describe 'Validations' do
    it { should have_attached_file(:image) }
    it { should validate_attachment_content_type(:image).
        allowing('image/png', 'image/gif').
        rejecting('text/plain', 'text/xml') }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:property) }
  end
end
