class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.integer :year
      t.string :semester

      t.timestamps
    end
  end
end
