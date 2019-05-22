class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, :end_date, presence: true
  validates :confirmed, inclusion: { in: ['pending', 'confirmed', 'cancelled'] }
end
