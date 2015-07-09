class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :role, null: false
      t.integer :index, null: false

      t.timestamps null: false
    end
  end
end
