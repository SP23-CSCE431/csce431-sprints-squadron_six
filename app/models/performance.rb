class Performance < ApplicationRecord
  belongs_to :exam
  belongs_to :user
  validates :performance_points, :exam_id, :user_id, presence: true
end
