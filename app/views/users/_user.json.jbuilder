json.extract! user, :id, :full_name, :email, :phone, :country, :date_of_birth, :created_at, :updated_at
json.url user_url(user, format: :json)
json.profile_image rails_blob_url(user.profile_image) if user.profile_image.present?