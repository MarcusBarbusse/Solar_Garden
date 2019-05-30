# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  new_user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    )
  new_user.save
end

20.times do
  Garden.create!(
    title: Faker::Beer.name,
    description: Faker::Lorem.paragraphs(1).join,
    address: "Cantersteen 10, Brussel",
    square_meters: rand(25..100),
    price: rand(5..50),
    user_id: rand(1..5),
   )
end
