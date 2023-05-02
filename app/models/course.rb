class Course < ApplicationRecord
  # set up relationship with exams, set to destroy exams when course is deleted
  has_many :exam, dependent: :destroy
  # Allow course attributes to be searchable
  def self.ransackable_attributes(_auth_object = nil)
    %w[course_hours course_name]
  end

  validates_presence_of :course_name
  validates_presence_of :course_hours



  # course hours max=6, min=0. must be integer
  validates :course_hours, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 6 }
  # course name length is set to 7, validation is there to prevent duplicates
  validates :course_name, length: { is: 7 }, uniqueness: { case_sensitive: false }

  validates_uniqueness_of :course_name
end

