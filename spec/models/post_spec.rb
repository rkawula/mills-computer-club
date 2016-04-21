require "rails_helper"

RSpec.describe Post do
	describe ".create_slug" do
		it "replaces non-word characters with dashes" do
			slug = Post.create_slug "hello, this is an odd sort of message. there are also #s, including 9's."
			expect(slug).to eq "hello-this-is-an-odd-sort-of-message-there-are-also-s-including-9s"
		end

		it "downcases the entire message" do
			slug = Post.create_slug "HELLO!!! :)"
			expect(slug).to eq "hello-"
		end
	end
end