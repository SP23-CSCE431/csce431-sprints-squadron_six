class AddAdminToAuthUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :authusers, :admin, :boolean, default: false
  end
end
