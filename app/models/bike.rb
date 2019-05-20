class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, :category, :description, :photo, :gender, :size, :rating, presence: true
  validates :rating, includes: { in: [1, 2, 3, 4, 5] }
  validates :gender, includes: { in: ['M', 'F'] }
  validates :size, includes: { in: ['sm', 'md', 'lg'] }
  validates :category, includes: { in: ['mountain', 'bmx', 'road', 'fixi', 'electric'] }
end
