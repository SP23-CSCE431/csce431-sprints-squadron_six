class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :user_id
      t.date :exam_date

      t.timestamps
    end
  end
end
