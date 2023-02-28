class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.date :exam_date
      t.string :exam_grade
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
