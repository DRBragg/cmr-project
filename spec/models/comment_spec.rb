require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should have_valid(:body).when('I am a body', "I'm also a body") }
  it { should_not have_valid(:body).when('', nil, "Need ten!", "255 max" * 37) ) }

  it { should have_valid(:review).when(Review.new) }
  it { should belong_to :user }

end
