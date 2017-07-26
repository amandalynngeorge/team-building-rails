Rails.application.routes.draw do
  resources :topics
  resources :activities
  resources :categories
  resources :users
  resources :sessions

  get '/sign_in' => "sessions#new"
  post '/sessions' => "sessions#create"

  get '/sign_out', to: "sessions#destroy"

  root 'sessions#home', as: 'home'

  get '/auth/facebook/callback' => 'sessions#create'
end
