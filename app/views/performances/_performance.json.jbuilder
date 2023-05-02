json.extract!(performance, :id, :performance_points, :exam_id, :user_id, :created_at, :updated_at)
json.url(performance_url(performance, format: :json))
