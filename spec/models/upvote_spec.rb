require 'rails_helper'

RSpec.describe Upvote, type: :model do
  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:review).when(Review.new) }
  it { should_not have_valid(:review).when(nil) }

  it { should belong_to :user }
  it { should belong_to :review }

#researching testing index validation
end
