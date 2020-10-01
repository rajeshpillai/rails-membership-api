# Install Active Storage (for file upload)

- $ rails active_storage:install
- $ rails db:migrate


# config/environments/development.rb

## Set local disk as storage
- config.active_storage.service  = :local
NOTE: Also refer storage.yml

# User model

- has_one_attached :profile_image


# Get Direct URL active storage
  def show
    ActiveStorage::Current.host = "http://localhost:3000"
    attachment_blob = ActiveStorage::Attachment.find_by(record_type: "User", record_id: @user.id).blob
    @direct_url = ActiveStorage::Blob.service.url(
        attachment_blob.key,
        expires_in: 20000,
        disposition: "attachment",
        filename: attachment_blob.filename,
        content_type: attachment_blob.content_type
    )
  end

<- APPRACH ONE ENDS ABOVE>








