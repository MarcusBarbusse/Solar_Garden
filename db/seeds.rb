# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  new_user = User.new(
    email: Faker::Internet.email,
    encrypted_password: "123456",
    name: Faker::Name.name,
    adress: Faker::Address.street_address,
    city: Faker::Address.city,
    country: "USA",
    postal_code: Faker::Address.zip_code,
    garden_owner: true
    )
  new_user.save
end

5.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: "123456",
    name: Faker::Company.name,
    adress: Faker::Address.street_address,
    city: Faker::Address.city,
    country: "USA",
    postal_code: Faker::Address.zip_code,
    garden_owner: false
    )
end


10.times do
  Garden.create(
    title: Faker::Lorem.words(rand(5)).join,
    description: Faker::Lorem.paragraphs(1).join,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    country: "USA",
    postal_code: Faker::Address.zip_code,
    square_meters: rand(25..100),
    price: rand(5..50),
    user_id: rand(1..10)
    )
end
