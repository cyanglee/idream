RailsAdmin.config do |config|
  config.excluded_models = ['Role','Assignment', 'Ability']
  config.authorize_with :cancan 
end