class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.int :year
      t.string :semester

      t.timestamps
    end
  end
end
