class AddAvatarToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :avatar, :string
  end
end
