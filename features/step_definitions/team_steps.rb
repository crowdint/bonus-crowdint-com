Given(/^a team exists with name: "(.*?)"$/) do |name|
  Fabricate(:team, name: name)
end
