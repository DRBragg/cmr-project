require 'faker'
FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "password"
    password_confirmation "password"
    first_name "Guy"
    last_name "Fieri"
  end
end
