Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, on_failed_registration: lambda { |env|
    UsersController.action(:new).call(env)
  }
end