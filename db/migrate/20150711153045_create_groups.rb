class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.string :password_salt
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
