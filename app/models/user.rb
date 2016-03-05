# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  provider         :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  profile          :string(255)
#  admin            :boolean         default(FALSE), not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class User < ActiveRecord::Base

	attr_accessible :profile, :uid, :name
	belongs_to :team
	has_many :hackathons, through: :team

	def self.from_omniauth(auth)
		# Finds user from database; else, creates new entry and saves.
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
	end
end
