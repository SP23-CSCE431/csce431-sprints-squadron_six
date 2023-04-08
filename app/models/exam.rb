class Exam < ApplicationRecord
  belongs_to :course
  has_many :performance

  # validate that a course and date are inputted
  # grades doesn't have to be inputted at creation
  validates_presence_of:course_id
  validates_presence_of:exam_date

  # mount uploader for file upload
  mount_uploader :avatar, AvatarUploader

end
