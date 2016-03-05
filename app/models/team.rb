class Team < ActiveRecord::Base
  attr_accessible :project_name
  has_many :users
  belongs_to :hackathon
  
end
