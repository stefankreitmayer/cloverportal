class RemovePasswordFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :password_salt, :string
    remove_column :groups, :password_hash, :string
  end
end
