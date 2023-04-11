class CreateAdminusers < ActiveRecord::Migration[7.0]
  def change
    create_table :adminusers, if_not_exists: true do |t|
      t.string :email
      t.boolean :isaadmin

      t.timestamps
    end
  end
end
