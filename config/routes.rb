Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"
  root to: 'users#index'
  resources :users
  post 'rest/verify_user', to: 'users#authentication_user', as: :verify_user
end
