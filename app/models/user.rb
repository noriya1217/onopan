class User < ApplicationRecord
  has_many :number_purchases, dependent: :destroy
  has_many :relationship, dependent: :destroy
end
