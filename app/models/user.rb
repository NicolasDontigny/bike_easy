class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :bookings
  has_many :bikes
  has_many :users, through: :bikes
  has_many :reviews, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :postal_code, presence: true
  validates :email, uniqueness: true
end
