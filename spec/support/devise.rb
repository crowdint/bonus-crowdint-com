load 'support/request_macros.rb'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend RequestMacros, type: :request
  config.extend ControllerMacros, type: :controller
end
