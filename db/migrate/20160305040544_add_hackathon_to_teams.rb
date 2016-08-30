class AddHackathonToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :hackathon_id, :integer
  end
end
