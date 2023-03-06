class Course < ApplicationRecord
    has_many :exam

    validates_presence_of :course_name
    validates_presence_of :course_hours

    validates_uniqueness_of :course_name

    # course hours max=6, min=0. must be integer
    validates :course_hours, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 6}
end
