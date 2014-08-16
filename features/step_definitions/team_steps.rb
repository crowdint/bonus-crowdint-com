Given(/^a team exists with name: "(.*?)"$/) do |name|
  @team = Fabricate(:team, name: name)
end

Given(/^I am part of a team with name: "(.*?)"$/) do |team_name|
  step %{a team exists with name: "#{team_name}"}
  @team.users << @user
end

Given(/^the event is assigned to team "(.*?)"$/) do |team_name|
  team        = Team.where(name: team_name).first
  @event.team = team
  @event.save!
end
