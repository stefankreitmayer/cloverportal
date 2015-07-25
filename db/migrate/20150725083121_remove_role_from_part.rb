class RemoveRoleFromPart < ActiveRecord::Migration
  def change
    remove_column :parts, :role, :string
  end
end
