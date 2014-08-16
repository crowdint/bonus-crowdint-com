Given(/^a user exists with name: "(.*?)"$/) do |name|
  Fabricate(:user, name: name)
end
