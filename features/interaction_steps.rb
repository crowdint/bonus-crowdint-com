When(/^I click on "(.*?)"$/) do |link|
  click_link link
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I press "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see "(.*?)"$/) do |expected_text|
  assert_equal true, page.has_content?(expected_text)
end
