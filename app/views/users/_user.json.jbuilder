json.extract! user, :id, :first_name, :last_name, :email, :password, :role, :uin, :grad_year, :created_at, :updated_at
json.url user_url(user, format: :json)
