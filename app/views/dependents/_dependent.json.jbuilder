json.extract! dependent, :id, :relationship, :name, :email, :phone, :blood_group, :date_of_birth, :weight, :height, :user_id, :created_at, :updated_at
json.url dependent_url(dependent, format: :json)
