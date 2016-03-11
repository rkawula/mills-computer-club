OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, ENV['google_oauth_id'],
	ENV['google_oauth_key'],
	{client_options:
		{ssl:
			{ca_file: Rails.root.join("cacert.pem").to_s}}}
end