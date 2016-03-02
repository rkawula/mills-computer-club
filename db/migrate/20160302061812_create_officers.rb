class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|

      t.string :name
      t.string :title
      t.string :img_url
      t.boolean :undergrad

      t.timestamps
    end
  end
end
