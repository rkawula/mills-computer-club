class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  attr_accessible :contents, :title, :user_id, :img_url, :published

  	def created_date_readable
		created_at.to_formatted_s(:long_ordinal)
	end
	
end
