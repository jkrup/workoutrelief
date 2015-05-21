Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 497119167023859, "ed21ea7564c417673769f763ef7599f5"
  provider :identity, :fields => [:email], :on_failed_registration => lambda{ |env| 
    IdentitiesController.action(:new).call(env)
  }
end
