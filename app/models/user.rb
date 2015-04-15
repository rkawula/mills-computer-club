class User < ActiveRecord::Base
  attr_accessible :user_id, :given_name, :family_name
end
