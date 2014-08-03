Given(/^a user with name "(.*?)"$/) do |name|
  create(:user, name: name)
end
