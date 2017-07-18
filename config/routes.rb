Rails.application.routes.draw do
  resources :activities
  resources :categories
  resources :users
  resources :sessions

  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  post '/sign_out', to: 'sessions#destroy'

  get '/', to: 'sessions#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
