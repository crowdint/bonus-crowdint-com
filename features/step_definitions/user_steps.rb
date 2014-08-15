Given(/^a user with name "(.*?)"$/) do |name|
  Fabricate(:user, name: name)
end
