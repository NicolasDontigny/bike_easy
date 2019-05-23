class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  validates :name, :photo, :price, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  # validates :gender, inclusion: { in: ['M', 'F'] }
  # validates :size, inclusion: { in: ['sm', 'md', 'lg'] }
  validates :category, inclusion: { in: ['Mountain', 'BMX', 'Road', 'Fixi', 'Electric', 'City', 'Fatbike'] }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
