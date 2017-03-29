class PropertyImage < ApplicationRecord

  has_attached_file :image

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :property

end
