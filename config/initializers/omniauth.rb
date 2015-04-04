Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2, ENV['401203391678-q4u8su885ncij18isl8gj6atkq52b4g3.apps.googleusercontent.com'], ENV['67NnbyThVsGStRPUAbYgCbf-'], {
	scope: ['email',
		'https://www.googleapis.com/auth/gmail.modify'],
		access_type: 'offline'}
end