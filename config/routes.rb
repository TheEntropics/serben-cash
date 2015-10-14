Rails.application.routes.draw do


  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :roles
  resources :users do
    delete '/:role_id', action: 'destroy_role', as: 'destroy_role'
    post '/new_role', action: 'new_role', as: 'new_role'
  end
end
