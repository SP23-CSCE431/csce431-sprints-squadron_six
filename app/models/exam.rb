class Exam < ApplicationRecord
  belongs_to :course
  has_many :performance

  # validate that a course and date are inputted
  # grades doesn't have to be inputted at creation
  validates_presence_of:course_id
  validates_presence_of:exam_date
  # validates_presence_of:exam_grade
  

  # a course can't be created that already exists
  # validates_uniqueness_of:course_id
end
