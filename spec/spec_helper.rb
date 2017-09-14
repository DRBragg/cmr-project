#allows coveralls to use rspec and run our rspec tests
=======
require 'valid_attribute'

require 'coveralls'
Coveralls.wear!('rails')

require File.expand_path('../../config/environment', __FILE__)
require 'email_spec'

RSpec.configure do |config|

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
    config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

end
