OmniAuth.configure do |config|
  config.test_mode = true
  config.add_mock(:default, {
    :info => {
      :email => 'foobar@crowdint.com',
      :name => 'foo',
      :password => 'qwerty123',
      :is_admin => true
    }
  })
end
