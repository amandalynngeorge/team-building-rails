Rails.application.routes.draw do
  resources :topics
  resources :activities
  resources :categories
  resources :users

  get '/sign_in' => "sessions#new"
  get '/sessions' => "sessions#create"

  root 'sessions#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
