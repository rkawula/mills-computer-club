class Team < ActiveRecord::Base
  attr_accessible :project_name, :summary, :email
  has_many :users
  belongs_to :hackathon

  validates_uniqueness_of :project_name, :allow_nil => true, :allow_blank => true, :case_sensitive => false
  
  validates :email, presence: true

  validates :summary, presence: true

  def self.validate_and_create project_name, summary, email, hackathon
  	team = Team.new project_name: project_name, summary: summary, email: email
    team.hackathon_id = hackathon
  	if team.valid?
  		team.save!
    end
    return team
  end
  
end
