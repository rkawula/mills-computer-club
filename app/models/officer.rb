class Officer < ActiveRecord::Base
  has_attached_file :image
  attr_accessible :name, :title, :undergrad, :image
  validates_attachment :image, content_type: { content_type:
              ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
end
