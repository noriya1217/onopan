class Product < ApplicationRecord
  belongs_to :store
  has_many :product_images, dependent: :destroy
  has_many :number_purchases, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :name, presence: true
  validates :number, presence: true
  validates :price, presence: true
  validates :content, presence: true
  validates :preservation, presence: true
  validates :how_to_eat, presence: true
  validates :expiration, presence: true
  validates :shipping, presence: true
end
