Rails.application.routes.draw do
  get 'test/index'

  root 'sessions#new'

  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :articles, only: [:index, :create, :destroy]
end
