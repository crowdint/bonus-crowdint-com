Then(/^I should not see "(.*?)" within the member list$/) do |expected_text|
  within('#members') do
    assert_equal false, page.has_content?(expected_text)
  end
end
