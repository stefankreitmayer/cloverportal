class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.belongs_to :group, index: true, foreign_key: true
      t.string :password_salt
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
