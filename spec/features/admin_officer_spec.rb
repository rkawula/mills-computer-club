require "rails_helper"

RSpec.feature "Officer CMS", type: :feature do
	scenario "Administrator adds a new officer" do
		visit "/admin/officers/new"

		fill_in "Name", with: "Happy officer"
		click_button "Submit"

		expect(page).to have_text "Happy officer"
	end
end