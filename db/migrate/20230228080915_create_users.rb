class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_fname
      t.string :user_lname
      t.string :user_email
      t.string :user_password
      t.string :user_role
      t.date :user_grad_year
      t.integer :user_points

      t.timestamps
    end
  end
end
