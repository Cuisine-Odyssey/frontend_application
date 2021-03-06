# app/config/routes.rb

Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'dashboard', to: 'users#show'

  resources :recipes, only: [:index, :show]
  resources :cocktails, only: [:index, :show]
  post '/recipes/:id/like', to: 'recipes#vote'
  post '/recipes/:id/dislike', to: 'recipes#vote'
  post '/cocktails/:id/like', to: 'cocktails#show'
  post '/cocktails/:id/dislike', to: 'cocktails#show'
end
