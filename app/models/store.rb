class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :telephone, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :access, presence: true
  validates :image, presence: true

end
