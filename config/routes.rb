Rails.application.routes.draw do

  get '/auth/instagram', as: :login
  get  'auth/instagram/callback', to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  get  '/dashboard', to: 'dashboard#show'
  get 'dashboard/feed', to: 'dashboard#index'
  get 'dashboard/popular', to: 'dashboard#popular'
  get '/user-search', to: 'dashboard#user_search'
  get '/search', to: 'dashboard#search'
  get '/profile', to: 'profile#show'
  root 'home#show'
end
