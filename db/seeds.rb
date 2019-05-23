require 'faker'

Bike.destroy_all
User.destroy_all

guillaume = User.create(
  first_name: 'Guillaume',
  last_name: 'Grassiant',
  postal_code: 'HG5',
  email: 'guillaume@gmail.com',
  password: '123456'
)

michael = User.create(
  first_name: 'Michael',
  last_name: 'Zhu',
  postal_code: 'H8U',
  email: 'michael@gmail.com',
  password: '123456'
)

stephanie = User.create(
  first_name: 'Stéphanie',
  last_name: 'Bouchard',
  postal_code: 'JK7',
  email: 'steph@gmail.com',
  password: '123456'
)


categories = ['Mountain', 'BMX', 'Road', 'Fixi', 'Electric', 'City', 'Fatbike']
names = ['Pro', 'Lite', 'Extreme', 'Cozy', 'Sexy']

users = [guillaume, michael, stephanie]

photo_keys = ["bcbxnzaixehdlv5lecao", "fupjvvq2tihuxgaptveb", "p93rhxyuh9u6okwbwhmb", "evmvt6qqbywpgu3zp1sw", "bzdh3a53rh7t08cmcwso", "gnpg7dqftmrgrsqehxgx", "cvqfw7jpx7oj89yahl1r", "lifzcfowsmnj9bo7frel", "bgz6l0th3mc4a05n8uhv", "emmao9m5t79cl6psbrlr", "qfu8wcsxooq8rtp3qtxy", "y4tousqi7bmuho9mqpd8", "zxa8qwstliusfvmmlyaj", "yofdglmybmmix7n8rj52", "x67g4imqnh3jz0o9f9qy"]

addresses = [
  "H1V 1B3",
  "H1S 1K3",
  "H1Z 4P3",
  "H4T 1M8",
  "H7P 0A5",
  "H1Z 4E9",
  "6893 Sherbrooke St E, Montreal",
  "700 Rue Georges-Bizet, Montréal",
  "255 Chemin Île Ste Marguerite, Boucherville"
]

descriptions = [
  'For a nice time in your city',
  'For extreme sports fans, or anybody really',
  'Can be perfect to commute to work',
  'Your granny will love it',
  'Charm your friends with this magestic bike'
]

users.each do |user|
  4.times do
    category = categories.sample
    bike = Bike.new(
      name: "#{category} #{names.sample} #{rand(8)}.#{rand(30)}",
      category: category,
      description: descriptions.sample,
      address: addresses.sample,
      latitude: rand * 1 + 44.5,
      longitude: rand * -1 - 72.5,
      gender: ['F', 'M'].sample,
      rating: [1, 2, 3, 4, 5].sample,
      size: ['sm', 'md', 'lg'].sample,
      remote_photo_url: "https://res.cloudinary.com/da3vccwkh/image/upload/v1558553568/bike_eazy/" + photo_keys.sample,
      price: rand * 50
    )

    bike.user = user

    bike.save
  end

end
