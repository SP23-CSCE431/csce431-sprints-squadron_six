class CreateAlumnis < ActiveRecord::Migration[7.0]
  def change
    create_table :alumnis do |t|
      t.integer :ID
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :graduation_year
      t.string :company

      t.timestamps
    end
  end
end
