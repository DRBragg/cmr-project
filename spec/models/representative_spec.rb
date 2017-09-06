require 'rails_helper'

RSpec.describe Representative, type: :model do
  it { should have_valid(:first_name).when('Vanessa', 'Drew', 'Beth', 'Tim') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Smith', 'Academy') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:office).when('President', 'Mayor') }
  it { should_not have_valid(:office).when('', nil) }

  it { should have_valid(:email).when('someone@email.com', 'anyone@email.net', nil) }
  it { should_not have_valid(:email).when('', 'user', 'email@@com') }

  it { should have_valid(:party).when('Democrat', 'Republican', nil) }

  it { should have_valid(:bio).when('Info about the Representative', 'Trying to take over the world') }
  it { should_not have_valid(:bio).when('', nil, "Need ten!", "255 max" * 37) }

  it { should have_valid(:elected).when(Date.parse('03/01/2015')) }
  it { should_not have_valid(:elected).when('', nil) }

  it { should have_valid(:phone_number).when('1234567890') }
  it { should_not have_valid(:phone_number).when('', nil, '123-456', '123-456-7890') }

  it { should have_valid(:picture_url).when('www.placeholder.com', 'http://github.com/avatar') }
  it { should_not have_valid(:picture_url).when('', nil) }
end
