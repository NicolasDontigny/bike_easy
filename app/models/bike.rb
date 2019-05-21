class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, :category, :description, :photo, :gender, :size, :price, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :gender, inclusion: { in: ['M', 'F'] }
  validates :size, inclusion: { in: ['sm', 'md', 'lg'] }
  validates :category, inclusion: { in: ['mountain', 'bmx', 'road', 'fixi', 'electric'] }
end
