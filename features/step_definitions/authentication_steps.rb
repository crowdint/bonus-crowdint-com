Given(/^I am logged in as an admin$/) do
  user = Fabricate(:admin_user)
  visit admin_root_path

  fill_in 'Email'    , with: user.email
  fill_in 'Password' , with: user.password

  click_button 'Sign in'
end

Given(/^I am logged in as a user$/) do
  @user = Fabricate(:user)

  visit root_path

  fill_in 'Email'    , with: @user.email
  fill_in 'Password' , with: @user.password

  click_button 'Sign in'
end
