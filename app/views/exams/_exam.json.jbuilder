json.extract!(exam, :id, :exam_date, :exam_grade, :course_id, :created_at, :updated_at)
json.url(exam_url(exam, format: :json))
