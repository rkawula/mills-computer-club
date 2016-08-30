Feature: Visitors can easily read blog posts created by the website team.

	Scenario: Viewing the blog index.

		Given that there is a blog post titled "Welcome", by user id "1"
		And that there is a user with id "1", named "Rachel Kawula"
		When I visit the "Blog" page
		Then I should see a post titled "Welcome"
		And there is a button called "Read More"

		Given that there are "6" posts in the database
		When I visit the "Blog" page
		Then I should see exactly "5" posts

	Scenario: View specific blog post.

		Given that there is a blog post titled "First post", by user id "1", with contents "Hello world"
		And that there is a user with id "1", named "Rachel Kawula"
		When I visit the "Blog" page
		And I click on "Read More" for "First post"
		Then I should see "First post"
		And I should see "Posted by Rachel Kawula"
		And I should see "Hello world"

		Given that there is a blog post titled "Second post", by user id "nil", with contents "Another post has been created!"
		When I visit the "Blog" page
		And I click on "Read More" for "Second post"
		Then I should see "Second post"
		And I should see "Posted by Admin"
		And I should see "Another post has been created!"

	Scenario: Posts have nice slugs and avoid collision.