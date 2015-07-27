class AddAssignedToParts < ActiveRecord::Migration
  def change
    add_column :parts, :assigned, :string, default: 'none'
  end
end
