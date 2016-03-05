class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :project_name, default: "undecided"

      t.timestamps
    end
  end
end
