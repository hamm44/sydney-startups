if Rails.env == "production"
  PAPERCLIP_STORAGE_OPTIONS = {
    :storage => :s3,
    :s3_credentials => { :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :bucket => ENV['S3_BUCKET_NAME'] }
  }
else
  PAPERCLIP_STORAGE_OPTIONS = {}
end