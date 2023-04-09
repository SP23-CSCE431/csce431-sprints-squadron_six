class Course < ApplicationRecord
  has_many :exam, dependent: :destroy
  def self.ransackable_attributes(_auth_object = nil)
    %w[course_hours course_name]
  end

  validates_presence_of :course_name
  validates_presence_of :course_hours

  # TODO: implement required format for course name &

  # course hours max=6, min=0. must be integer
  validates :course_hours, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 6 }
  validates :course_name, length: { is: 7 }, uniqueness: { case_sensitive: false }

  validates_uniqueness_of :course_name

  # makes sure deletion is cancelled if there are still exams
  # before_destroy :check
  # def check
  # # will always be true since all grandchildren have already been destroyed at this stage
  #     return self.exam.still_there.empty?
  # end
end
