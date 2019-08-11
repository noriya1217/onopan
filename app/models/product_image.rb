class ProductImage < ApplicationRecord
  belongs_to :product

  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
