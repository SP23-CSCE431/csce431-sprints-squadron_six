class Course < ApplicationRecord
    has_many :exam

    validates_presence_of :course_name
    validates_presence_of :course_hours
end
