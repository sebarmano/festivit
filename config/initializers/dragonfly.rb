require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "de0ea5bfdb03aba2880a1ac18d465194fc76f268403e5bfe80839a7581e803d4"

  url_format "/media/:job/:name"

  # Logger
  Dragonfly.logger = Rails.logger

  # Mount as middleware
  Rails.application.middleware.use Dragonfly::Middleware

  # Add model functionality
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.extend Dragonfly::Model
    ActiveRecord::Base.extend Dragonfly::Model::Validations

  if Rails.env.production?
    datastore :dropbox,
    app_key:              Rails.application.secrets.dropbox_app_key
    app_secret:           Rails.application.secrets.dropbox_app_secret
    access_token:         Rails.application.secrets.dropbox_access_token
    access_token_secret:  Rails.application.secrets.dropbox_access_token_secret
    user_id:              Rails.application.secrets.dropbox_user_id
    root_path:            Rails.root.join('public/system/dragonfly', Rails.env)
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
    end
  end
end
