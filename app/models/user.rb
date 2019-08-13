class User < ApplicationRecord
  has_many :number_purchases, dependent: :destroy
end
