json.extract! user, :id, :full_name, :email, :phone, :country, :date_of_birth, :created_at, :updated_at
json.url user_url(user, format: :json)
