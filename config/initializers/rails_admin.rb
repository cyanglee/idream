RailsAdmin.config do |config|
  config.excluded_models = ['Role','Assignment', 'Ability', 'OrganizationAdmin']
  config.authorize_with :cancan 
end