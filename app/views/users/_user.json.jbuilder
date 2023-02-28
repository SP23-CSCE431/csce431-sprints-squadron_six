json.extract! user, :id, :user_fname, :user_lname, :user_email, :user_password, :user_role, :user_grad_year, :user_points, :created_at, :updated_at
json.url user_url(user, format: :json)
