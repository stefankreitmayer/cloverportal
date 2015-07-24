class AddGroupToPart < ActiveRecord::Migration
  def change
    add_reference :parts, :group, index: true
  end
end
