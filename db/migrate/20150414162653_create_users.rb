class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |u|
      u.integer :user_id, null: false
      u.string :given_name
      u.string :family_name, null: false
      u.string :provider
      u.boolean :admin, null: false, default: false

      u.timestamps
    end
  end

  def down
    drop_table :users
  end
end
