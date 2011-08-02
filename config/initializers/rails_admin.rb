RailsAdmin.config do |config|
  config.excluded_models = ['Role','Assignment', 'Ability']
end

RailsAdmin.authorize_with :cancan