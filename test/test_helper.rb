ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'wrong/adapters/minitest'
Wrong.config.color


Dir[File.expand_path('../support/*.rb', __FILE__)].each { |f| require f }

require 'capybara/poltergeist'

Capybara.configure do |c|
  c.default_host = "http://lvh.me"
  c.current_driver = :poltergeist
  c.always_include_port = true
  c.asset_host = "http://lvh.me:3000"
end

FactoryGirl.reload

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Wrong
end

class ActionDispatch::IntegrationTest
 setup do
   Capybara.app_host = Capybara.default_host
 end
end
