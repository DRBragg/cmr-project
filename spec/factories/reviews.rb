FactoryGirl.define do
  factory :review do
    headline "This is a review"
    body "This is a body"
    rating 3
    representative
    user
  end
end
