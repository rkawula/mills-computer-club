class AddImageToOfficers < ActiveRecord::Migration
  def self.up
  	add_attachment :officers, :image
  end

  def self.down
  	remove_attachment :officers, :image
  end

end
