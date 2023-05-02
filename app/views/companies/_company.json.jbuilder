json.extract!(company, :id, :company_name, :company_location, :company_industry, :created_at, :updated_at)
json.url(company_url(company, format: :json))
