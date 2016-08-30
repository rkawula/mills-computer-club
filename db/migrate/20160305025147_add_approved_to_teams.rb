class AddApprovedToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :approved, :boolean, default: false
  end
end
