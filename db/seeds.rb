require 'faker'

puts 'Erasing DB'

Bike.destroy_all
User.destroy_all
Review.destroy_all

puts 'Creating users'

guillaume = User.new(
  first_name: 'Guillaume',
  last_name: 'Grassiant',
  profile_description: "My Bike app is soooo dope!",
  postal_code: 'HG5',
  email: 'guillaume@gmail.com',
  password: '123456',
  remote_avatar_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794599/BikeEazy/guillaume-grassiant_xdvvud.jpg"
)

nicolas = User.create(
  first_name: 'Nic',
  last_name: 'the Duck',
  profile_description: "My Bike app is soooo dope!",
  postal_code: 'H8U',
  email: 'nicolas@gmail.com',
  password: '123456',
  remote_avatar_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/nicolas-dontigny_n0a8xj.jpg"
)

michael = User.create(
  first_name: 'Michael',
  last_name: 'Zhu',
  profile_description: "My Bike app is soooo dope!",
  postal_code: 'H8U',
  email: 'michael@gmail.com',
  password: '123456',
  remote_avatar_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794596/BikeEazy/michael-zhu_r2iooy.jpg"
)

romain = User.create(
  first_name: 'Romain',
  last_name: 'Penaruiz',
  profile_description: "My Bike app is soooo dope!",
  postal_code: 'H8U',
  email: 'romain@gmail.com',
  password: '123456',
  remote_avatar_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/romain-penaruiz_i8vf7y.jpg"
)

fito = User.create(
  first_name: 'Fito',
  last_name: 'Brandt',
  profile_description: "My Bike app is soooo dope!",
  postal_code: 'JK7',
  email: 'fito@gmail.com',
  password: '123456',
  remote_avatar_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794594/BikeEazy/fito-brandt_uxdxul.jpg"
)

categories = ['Mountain', 'BMX', 'Road', 'Fixi', 'Electric', 'City', 'Fatbike']
names = ['Pro', 'Lite', 'Extreme', 'Cozy', 'Sexy']

users = [guillaume, michael, fito]

bike_names = ["Top Fuel 9.9 SL", "Session 9.9 29", "Fuel EX 9.9 29", "Slash 9.9", "Remedy 9.9", "Men's Turbo Levo Comp Carbon", "Trance Advanced Pro 29 0", "Reign Advanced 0", "Trance Advanced 0", "Intrigue Advanced 0", "Altitude Carbon 90", "Instinct Powerplay Alloy 70", "Reign Advanced 0", "Trance Advanced 0", "Powerplay C50", "Instinct Carbon 90 BC Edition", "Instinct Carbon 90 BC Edition", "Slash 9.8", "Glory Advanced 0", "Fuel EX 9.8 29", "Altitude Carbon 70", "Altitude Carbon 70 (SRAM)", "Thunderbolt 790 MSL BC Edition", "Epic Expert EVO", "Powerfly LT 7 Plus", "Remedy 9.8", "Element Carbon 70", "Slayer Carbon 70", "Thunderbolt Carbon 90 BC Edition"]

photo_keys = ["Bike7_s0y239", "Bike10_tdehb5", "Bike9_ymgxhe", "Bike8_jszvc1", "Bike6_k4w54a", "Bike4_nztyy0", "Bike1_mp7qll", "Bike3_thrgwt", "Bike2_fiplah", "Bike5_svhheg"]

addresses = [
  "7325 Rue De Tilly, Montreal, Québec, Canada",
  "1333 Rue Notre-Dame Ouest, Montreal, Québec, Canada",
  "Saguenay, Quebec, Canada",
  "Parlement de Québec, La Cité-Limoilou, Capitale-Nationale, Canada",
  "Griffintown, Montreal, Montréal (06), Canada",
  "Olympic Stadium, Montreal, Montréal (06), Canada",
  "678 Boulevard Montréal-Toronto, Montreal West, Québec, Canada",
  "150 Chemin de la Pointe-Sud, Montreal, Québec, Canada",
  "659 Port de Montréal-Bickerdike, Montreal, Québec, Canada",
  "3298 Avenue Papineau, Montreal, Québec, Canada",
  "6789 Rue Sainte-Catherine Est, Montreal, Québec, Canada"
]

# descriptions = [
#   'For a nice time in your city',
#   'For extreme sports fans, or anybody really',
#   'Can be perfect to commute to work',
#   'Your granny will love it',
#   'Charm your friends with this magestic bike',
#   'Impress all your buddies with this beautiful bike!',
#   'Super good quality, I have '
# ]

puts 'Creating bikes'

3.times do
  bike = Bike.new(
    name: bike_names.shift,
    category: 'Mountain',
    address: addresses.shift,
    rating: [3, 4, 5].sample,
    remote_photo_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/" + photo_keys.sample,
    price: (rand * 32 + 8).round(2)
  )

  bike.user = guillaume
  bike.save!
end

bike = Bike.new(
  name: "Fito's last rented Bike",
  category: 'Fixi',
  address: addresses.shift,
  rating: [2, 3, 4, 5].sample,
  remote_photo_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/" + photo_keys.sample,
  price: (rand * 32 + 8).round(2)
)

bike.user = guillaume
bike.save!

3.times do
  bike = Bike.new(
    name: bike_names.shift,
    category: categories.sample,
    address: addresses.shift,
    rating: [1, 2, 3, 4, 5].sample,
    remote_photo_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/" + photo_keys.sample,
    price: (rand * 32 + 8).round(2)
  )

  bike.user = nicolas
  bike.save!
end

bike = Bike.new(
  name: 'Perfect for Fito!',
  category: 'Mountain',
  address: "5333 Avenue Casgrain, Montreal, Québec, Canada",
  rating: 5,
  remote_photo_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/" + photo_keys.sample,
  price: (rand * 32 + 8).round(2)
)

bike.user = nicolas

contents = [
  'Amazing bike, recommend to every mountain bike fan!',
  'It was a bit dusty, but works perfectly!',
  'No saddle, but nice'
]

puts 'Creating reviews'

review = Review.new(
  content: contents.shift,
  rating: 5
)
review.bike = bike
review.user = michael
review.date = Date.today
review.save!

review = Review.new(
  content: contents.shift,
  rating: 5
)
review.bike = bike
review.user = romain
review.date = Date.today
review.save!

review = Review.new(
  content: contents.shift,
  rating: 5
)
review.bike = bike
review.user = guillaume
review.date = Date.today
review.save!

puts 'Creating Fito\'s bikes'

4.times do
  bike = Bike.new(
    name: bike_names.shift,
    category: categories.sample,
    address: addresses.shift,
    rating: [1, 2, 3, 4, 5].sample,
    remote_photo_url: "https://res.cloudinary.com/ggrassiant/image/upload/v1558794669/BikeEazy/" + photo_keys.sample,
    price: (rand * 32 + 8).round(2)
  )

  bike.user = fito

  bike.save!
end

puts 'Done! Like the break of dawn.'
