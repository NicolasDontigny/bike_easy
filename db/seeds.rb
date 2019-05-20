require 'faker'

Bike.destroy_all

5.times do
  bike = Bike.new(
    name: Faker::Vehicle.make_and_model,
    category: ["mountain", 'road', 'electric', 'fixi', 'bmx'].sample,
    description: 'perfect for riding mountains',
    gender: 'M',
    rating: [1, 2, 3, 4, 5].sample,
    size: 'sm',
    photo: 'www.google.ca'
  )
  bike.user = User.first
  bike.save
end

5.times do
  bike = Bike.new(
    name: Faker::Vehicle.make_and_model,
    category: ["mountain", 'road', 'electric', 'fixi', 'bmx'].sample,
    description: 'perfect for riding long roads',
    gender: 'F',
    rating: [1, 2, 3, 4, 5].sample,
    size: ['sm', 'md', 'lg'],
    photo: 'www.google.ca'
  )
  bike.user = User.last
  bike.save
end
