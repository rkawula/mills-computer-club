Feature: Admins can easily access and edit the website, and only admins.

	Scenario: I can navigate to the officer CMS while logged in as admin.

		Given that I am logged in as administrator
		When I visit the "Admin" page
		Then I should see "Manage officers"

		Given that I am logged in as administrator
		And there is an officer with name "Rachel K", title "Website admin", and "graduate" student
		When I visit the "Admin" page
		And I click "Manage officers"
		Then I should see "Rachel K"
		And I should see "Website admin"
		And I should see "Add a new officer"