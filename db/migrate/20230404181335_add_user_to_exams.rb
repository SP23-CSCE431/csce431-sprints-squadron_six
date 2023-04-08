class AddUserToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :user_id, :string
  end
end
