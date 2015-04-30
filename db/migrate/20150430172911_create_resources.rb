class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :question
      t.text :answer
      t.string :url
      t.string :tag

      t.timestamps
    end
  end

  def down
    drop_table :resources
  end
end
