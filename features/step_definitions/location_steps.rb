When(/^I go to the "(.*?)" page$/) do |page|
  visit eval("#{page.sub(/ /, '_')}_path")
end

Then(/^I should be on the "(.*?)" page$/) do |page|
  assert_equal eval("#{page.sub(/ /, '_')}_path"), current_path
end
