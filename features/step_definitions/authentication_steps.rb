Given(/^I am logged in as an admin$/) do
  @user = Fabricate(:admin_user, email: "foobar@crowdint.com")
  visit user_omniauth_authorize_path(:google_oauth2)
end

Given(/^I am logged in as a user$/) do
  @user = Fabricate(:user, email: "foobar@crowdint.com")
  visit user_omniauth_authorize_path(:google_oauth2)
end
