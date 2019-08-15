class User < ApplicationRecord
  has_many :number_purchases, dependent: :destroy
  has_many :relationship, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
