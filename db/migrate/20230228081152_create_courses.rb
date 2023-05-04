class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses, if_not_exists: true do |t|
      t.string :course_name
      t.integer :course_hours

      t.timestamps
    end
  end
end
