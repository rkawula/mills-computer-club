class AddSummaryToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :summary, :text
  end
end
