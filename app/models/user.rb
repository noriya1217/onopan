class User < ApplicationRecord
  has_many :number_purchases, dependent: :destroy
  has_many :relationship, dependent: :destroy
  has_many :stores, through: :relationship

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
