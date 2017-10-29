Rails.application.routes.draw do
  resources :users

  post 'rest/verify_user', to: 'users#authentication_user', as: :verify_user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
