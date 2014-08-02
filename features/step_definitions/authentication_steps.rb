Given(/^I am logged in as an admin$/) do
  user                       = User.new
  user.email                 = 'test@example.com'
  user.password              = 'test1234'
  user.password_confirmation = 'test1234'
  user.is_admin              = true

  user.save!

  visit admin_root_path

  fill_in 'Email'    , with: 'test@example.com'
  fill_in 'Password' , with: 'test1234'

  click_button 'Sign in'
end
