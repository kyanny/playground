Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit_oauth2, ENV['FITBIT_CONSUMER_KEY'], ENV['FITBIT_CONSUMER_SECRET'], response_type: 'code', scope: 'activity heartrate location nutrition profile settings sleep social weight', provider_ignores_state: true
end
