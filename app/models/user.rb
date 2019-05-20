class User < ApplicationRecord
  has_many :bookings
  has_many :bikes
  has_many :users, through: :bikes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :postal_code, presence: true, allow_blank: false
end
