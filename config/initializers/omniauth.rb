Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, Figaro.env.google_oauth_id, Figaro.env.google_oauth_key, skip_jwt: true
end