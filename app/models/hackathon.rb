class Hackathon < ActiveRecord::Base
  attr_accessible :semester, :year
  has_many :teams
end
