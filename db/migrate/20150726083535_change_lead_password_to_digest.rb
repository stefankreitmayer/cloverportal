class ChangeLeadPasswordToDigest < ActiveRecord::Migration
  def change
    remove_column :leads, :password_salt, :string
    remove_column :leads, :password_hash, :string
    add_column :leads, :password_digest, :string
  end
end
