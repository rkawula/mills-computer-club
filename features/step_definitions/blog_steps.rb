Given(/^that there is a blog post titled "([^"]*)",
      by user id "([^"]*)"$/) do |title, author|
  @post = Post.create title: title, subtitle: 'Default',
                      contents: 'Default', published: true,
                      user_id: author
end

Given(/^that there is a user with id "([^"]*)",
      named "([^"]*)"$/) do |id, name|
  @user = User.new id: id, name: name
  @user.save!
end

Then(/^I should see a post titled "([^"]*)"$/) do |title|
  expect(page).to have_content title
end

Then(/^the author name is "([^"]*)"$/) do |name|
  expect(page).to have_content name
end

Then(/^there is a button called "([^"]*)"$/) do |button|
  expect(page).to have_content button
end

Given(/^that there are "([^"]*)" posts in the database$/) do |num_posts|
  num_posts.to_i.times do |i|
    Post.create title: 'Post number ' + i.to_s, published: true
  end
end

Then(/^I should see exactly "([^"]*)" posts$/) do |num_posts|
  num_posts.to_i.times do |i|
    expect(page).to have_content 'Post number ' + (i + 1).to_s
  end
  expect(page).to have_no_content 'Post number ' + (num_posts.to_i + 1).to_s
end

Given(/^that there is a blog post titled "([^"]*)", by user id "([^"]*)",
      with contents "([^"]*)"$/) do |title, id, content|
  Post.create title: title, user_id: id, contents: content, published: true
end

When(/^I click on "([^"]*)" for "([^"]*)"$/) do |link, post_title|
  within('#post-' + (Post.find_by title: post_title).id.to_s) do
    click_link link
  end
end
