class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :role
      t.integer :uin
      t.date :grad_year

      t.timestamps
    end
  end
end
