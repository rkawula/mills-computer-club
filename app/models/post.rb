class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  attr_accessible :contents, :title, :user_id, :img_url
end
