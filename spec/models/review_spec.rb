require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:headline).when('I am a headline', "I'm also a headline") }
  it { should_not have_valid(:headline).when('', nil) }

  it { should have_valid(:body).when('I am a body', "I'm also a body") }
  it { should_not have_valid(:body).when('', nil, "Need ten!", "255 max" * 37)  }

  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:rating).when('', nil, "one", 0, -1, 6) }

  it { should have_valid(:representative).when(Representative.new) }
  it { should belong_to :user }
  it { should have_many :comments }
end
