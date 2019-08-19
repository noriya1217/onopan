class User < ApplicationRecord
  has_many :number_purchases, dependent: :destroy
  has_many :relationship, dependent: :destroy
  has_many :stores, through: :relationship

  validates :name, presence: true
  validates :address, presence: true
  validates :age, numericality: { allow_blank: true , less_than_or_equal_to: 130 }
  validates :sex, inclusion: { in: %w(男 女) }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end
