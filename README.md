# Install Active Storage (for file upload)

- $ rails active_storage:install
- $ rails d:migrate


# config/environments/development.rb

## Set local disk as storage
- config.active_storage.service  = :local
NOTE: Also refer storage.yml

# User model

- has_one_attached :profile_image

# Gemfile
- gem 'active_model_serializers'

# Bundle
- $ bundle install

# Create serializer
rails g serializer user

This will create a new file in app/serializers/user_serializer.rb with the following contents

```
class UserSerializer < ActiveModel::Serializer
 # enable building url's outside of controllers
 include Rails.application.routes.url_helpers 
  
  attributes :id, :profile_image, :full_name, :email, :phone, :country,    
        :date_of_birth


  # We only want the URL of the image
  def profile_image
    if object.profile_image.attached?
      {
        url: rails_blob_url(object.profile_image)
      }
    end
  end

end
```






