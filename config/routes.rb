Rails.application.routes.draw do
  resources :topics
  resources :activities do
    collection do
      get 'short_to_long'
    end
  end
  resources :categories
  resources :users
  resources :sessions

  get '/sign_in', to: "sessions#new"
  post '/sessions', to: "sessions#create"
  get '/sign_out', to: "sessions#destroy"
  root 'sessions#home', as: 'home'

  get '/auth/facebook/callback' => 'sessions#create'

end
