OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '283097218538931', 'ef393cb9ceaf2f2b61ae2ebe44018565', :scope => 'email, read_stream, user_photos', :display => 'popup'
end

