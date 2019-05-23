class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  before_create :set_default_avatar

  has_many :bookings
  has_many :bikes
  has_many :users, through: :bikes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :postal_code, presence: true
  validates :email, uniqueness: true
  def set_default_avatar
    # your code
    user.avatar = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
    raise
  end
end
