# Install Active Storage (for file upload)

- $ rails active_storage:install
- $ rails db:migrate


# config/environments/development.rb

## Set local disk as storage
- config.active_storage.service  = :local
NOTE: Also refer storage.yml

# User model

- has_one_attached :profile_image


<- APPRACH ONE ENDS ABOVE>








