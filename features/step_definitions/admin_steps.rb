Given(/^that I am logged in as administrator$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I visit the "([^"]*)" page$/) do |page_name|
  visit post_index_path if page_name == "Blog"
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Given(/^there is an officer with name "([^"]*)", title "([^"]*)", and "([^"]*)" student$/) do |arg1, arg2, arg3|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end