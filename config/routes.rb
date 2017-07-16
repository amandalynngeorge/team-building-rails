Rails.application.routes.draw do
  resources :activities
  resources :categories
  resources :users

  get 'sign_up', to: 'user#new'
  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'
  get 'sign_out', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
