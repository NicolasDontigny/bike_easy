class Review < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
