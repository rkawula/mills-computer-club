class Team < ActiveRecord::Base
  attr_accessible :project_name, :summary, :email
  has_many :users
  belongs_to :hackathon
  validates :project_name,
            uniqueness: true, allow_nil: true, allow_blank: true,
            case_sensitive: false
  validates :email, presence: true
  validates :summary, presence: true

  def self.validate_and_create(team, hackathon)
    team = Team.new project_name: team[:project_name], summary: team[:summary],
                    email: team[:email]
    team.hackathon_id = hackathon
    team.save! if team.valid?
    team
  end
end
