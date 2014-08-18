Given(/^a user exists with name: "(.*?)"$/) do |name|
  Fabricate(:user, name: name)
end

Given(/^a user exists with name: "(.*?)" and "(.*?)" as team$/) do |name, team_name|
  user = Fabricate(:user, name: name)
  team = Team.where(name: team_name).first || Fabricate(:team, name: team_name)
  team.users << user
end
