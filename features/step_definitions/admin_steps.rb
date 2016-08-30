When(/^I visit the "([^"]*)" page$/) do |page_name|
  visit post_index_path if page_name == 'Blog'
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end
