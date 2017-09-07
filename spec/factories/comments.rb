FactoryGirl.define do
  factory :comment do
    body "It sucks"
    review
    user
  end
end
