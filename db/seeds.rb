# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create(
    username: Faker::Internet.usernaame,
    email: Faker::Internet.email,
    password: '111111',
    password_confirmation: '111111'
  )
end

admin = User.create(
  username: 'sugar',
  email: 'sugar@email.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

parts = [
  { name: 'engine' , total: 150, price: 3000 },
  { name: 'transmission' , total: 200, price: 1700 }, 
  { name: 'battery' , total: 600, price: 200 }, 
  { name: 'alternator', total: 750, price: 480 }, 
  { name: 'radiator' , total: 150, price: 300 }, 
  { name: 'front axle', total: 150, price: 1800 }, 
  { name: 'front steering and suspension' , total: 150, price: 1100},
  { name: 'brakes' , total: 600, price: 75}, 
  { name: 'catalyic cylynder' , total: 150, price: 300}, 
  { name: 'mufler' , total: 150, price: 98}, 
  { name: 'tail pipe' , total: 150, price: 350 }, 
  { name: 'fuel tank' , total: 150, price: 500}, 
  { name: 'rear axle', total: 150, price: 750 }, 
  { name: 'rear suspension', total: 150, price: 980 }
]

parts.each do |part|
  Part.create(part)
end
