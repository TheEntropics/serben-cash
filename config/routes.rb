Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root 'home#index'
  get '/admin', to: 'home#admin', as: 'admin'

  get '/login', to: 'login#login', as: 'login'
  post '/login', to: 'login#do_login'
  delete '/logout', to: 'login#logout', as: 'logout'

  resources :roles
  resources :months
  resources :events
  resources :payments
  resources :notifications
  resources :users do
    delete '/:role_id', action: 'destroy_role', as: 'destroy_role'
    post '/new_role', action: 'new_role', as: 'new_role'
  end
end
