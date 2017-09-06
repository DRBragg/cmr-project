require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('Vanessa', 'Drew', 'Beth', 'Tim') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Academy') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('someone@email.com', 'anyone@email.net') }
  it { should_not have_valid(:email).when('', nil, 'user', 'email@@com') }

  it 'has a mathcing password and password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'passwordconfirmation'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
