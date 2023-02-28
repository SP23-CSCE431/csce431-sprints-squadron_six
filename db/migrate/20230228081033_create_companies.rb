class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_location
      t.string :company_industry

      t.timestamps
    end
  end
end
