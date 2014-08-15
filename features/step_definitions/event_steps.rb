Given(/^an event with name "(.*?)" exists$/) do |event_name|
  Fabricate(:event, name: event_name)
end

Given(/^an event exists with name: "(.*?)"$/) do |event_name|
  Fabricate(:event, name: event_name)
end
