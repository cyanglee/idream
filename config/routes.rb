Myapp::Application.routes.draw do
  devise_for :users, :controllers => {:confirmations => "confirmations", :omniauth_callbacks => "users/omniauth_callbacks"} do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  # TODO: change the edit route. Don't display the user id in the url. Get the id directly from the session
  resources :users do
    resource :organization_admins, :only => [:show, :new, :destroy]
    resource :volunteer_jobs, :only => [:create, :show, :new, :destroy]
    #member do
    #  get :show_schools
    #  get :associate_schools
    #end
  end

  match 'jobs/manage', :to => 'jobs#manage'
  resources :jobs
  resources :organizations
  resources :organization_admins
  resources :volunteer_jobs

  #match '/admin', :to => 'pages#admin'
  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  match 'pages/confirmation', :to => 'pages#confirmation'
  root :to => 'pages#home'

end
