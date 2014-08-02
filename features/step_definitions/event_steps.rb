Given(/^an event with name "(.*?)" exists$/) do |event_name|
  Event.create! name: event_name
end
