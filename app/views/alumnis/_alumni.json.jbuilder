json.extract!(alumni, :id, :company_id, :user_id, :created_at, :updated_at)
json.url(alumni_url(alumni, format: :json))
