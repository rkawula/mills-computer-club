class RemoveTagFromResource < ActiveRecord::Migration
  def up
    remove_column :resources, :tag
  end

  def down
    add_column :resources, :tag, :string
  end
end
