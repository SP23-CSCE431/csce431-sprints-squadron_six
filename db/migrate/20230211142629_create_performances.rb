class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.string :user_id
      t.string :grade
      t.integer :points

      t.timestamps
    end
  end
end
