class RemoveImgUrlFromOfficersAndPosts < ActiveRecord::Migration
  def change
  	remove_column :officers, :img_url, :string
  	remove_column :posts, :img_url, :string
  end
end
