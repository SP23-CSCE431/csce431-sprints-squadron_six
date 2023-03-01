class Course < ApplicationRecord
    validates_presence_of :course_name
    validates_presence_of :course_hours
end
