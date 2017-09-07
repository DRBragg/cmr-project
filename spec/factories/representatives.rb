require 'faker'

FactoryGirl.define do
  factory :representative do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    office "Mayor of hoagie town"
    email "mayor@hoagie.com"
    party "Independent"
    bio "Dude loves hoagies"
    elected Date.today
    phone_number 1234567890
    picture_url "http://seaislenews.com/wp-content/uploads/sites/3/2017/03/1.4-sea-isle-city-flooding-4-1.jpg"
    user
  end
end
