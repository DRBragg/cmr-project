# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  Representative.create(
  first_name: "#{Faker::Name.first_name}",
  last_name: "#{Faker::Name.last_name}",
  office: "Senator",
  email: "#{Faker::Internet.email}",
  party: "#{Faker::Demographic.demonym}",
  bio: "#{Faker::HeyArnold.quote}",
  elected: Date.today,
  phone_number: "#{Faker::PhoneNumber.phone_number}",
  picture_url: "#{Faker::Avatar.image}",
  user_id: 1
  )
end

100.times do
  Review.create(
  headline: "#{Faker::DrWho.catch_phrase}",
  body: "#{Faker::DrWho.quote}",
  rating: "#{Faker::Number.between(1, 5)}",
  representative_id: Faker::Number.between(1, 10),
  user_id: 1
  )
end

1000.times do
  Comment.create(
  body: "#{Faker::ChuckNorris.fact}",
  review_id: Faker::Number.between(1, 100),
  user_id: 1
  )

end
