class AllowPartsIndexToBeNull < ActiveRecord::Migration
  def change
    change_column_null :parts, :index, true
  end
end
