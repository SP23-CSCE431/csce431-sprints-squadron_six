json.extract!(adminuser, :id, :email, :isaadmin, :created_at, :updated_at)
json.url(adminuser_url(adminuser, format: :json))
