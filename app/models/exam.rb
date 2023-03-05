class Exam < ApplicationRecord
  belongs_to :course
  has_many :performance
end
