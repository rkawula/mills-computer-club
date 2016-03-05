class Team < ActiveRecord::Base
  attr_accessible :project_name, :summary, :email
  has_many :users
  belongs_to :hackathon

  validates :project_name, presence: true,
  		uniqueness: { case_sensitive: false }
  
end
