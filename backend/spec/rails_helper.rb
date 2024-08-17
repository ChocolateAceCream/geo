# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'mongoid-rspec'
require 'webmock/rspec'
require 'factory_bot_rails'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Include Mongoid matchers
  config.include Mongoid::Matchers, type: :model
  config.include FactoryBot::Syntax::Methods

  # Use DatabaseCleaner to ensure a clean state for each test
  config.before(:suite) do
    Mongoid.raise_not_found_error = false
    DatabaseCleaner[:mongoid].strategy = :deletion
    DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
