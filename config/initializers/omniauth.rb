# In config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
 	provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], info_fields: "first_name, last_name, email"
 	# provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET_ID'], info_fields: "first_name, last_name, email"
end

Rails.application.config.middleware.use OmniAuth::Builder do
 	# provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'], info_fields: "first_name, last_name, email"
 	provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET_ID'], info_fields: "first_name, last_name, email"
end

# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET_ID'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
# end

# info_fields: "auth.info.first_name, auth.info.last_name, auth.info.email"