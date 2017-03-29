class Property < ApplicationRecord

  has_attached_file :floor_plan

  validates :description, :key_features, presence: true
  validates_attachment_content_type :floor_plan, content_type: /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  has_many :property_images, dependent: :destroy
  belongs_to :user

end
