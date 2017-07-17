Rails.application.routes.draw do
  resources :activities
  resources :categories
  resources :users
  resources :sessions

  get 'sign_up', to: 'user#new'
  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'
  get 'sign_out', to: 'session#destroy'

  get '/', to: 'sessions#home', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
