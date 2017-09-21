Rails.application.routes.draw do
  resources :topics, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :create, :show, :index] do
    resources :activities
  end
  get '/users/activities/new', to: "activities#new"

  resources :sessions
  resources :categories do
    resources :activities
  end
  resources :activities do
    collection do
      get 'short_to_long'
    end
  end

  get '/sign_in', to: "sessions#new"
  post '/sessions', to: "sessions#create"
  get '/sign_out', to: "sessions#destroy"
  root 'sessions#home', as: 'home'
  get '/auth/facebook/callback' => 'sessions#create'

  get '/activities/:id/activity_data', to: 'activities#activity_data'

  get '/users/:id/activities/new', to: 'users#new_activity'
end
