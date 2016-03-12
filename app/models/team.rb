class Team < ActiveRecord::Base
  attr_accessible :project_name, :summary, :email
  has_many :users
  belongs_to :hackathon

  validates :project_name, presence: true,
  		uniqueness: { case_sensitive: false }

  validates :email, presence: true

  validates :summary, presence: true

  def self.validate_and_create project_name, summary, email, hackathon
    if project_name == "" or project_name == nil
      project_name = "Undecided"
    end
  	team = Team.new project_name: project_name, summary: summary, email: email
    team.hackathon_id = hackathon
  	if team.valid?
  		team.save!
    end
    return team
  end
  
end
