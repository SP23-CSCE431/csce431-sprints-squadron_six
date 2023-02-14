class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :user_id
      t.integer :total_points

      t.timestamps
    end
  end
end
