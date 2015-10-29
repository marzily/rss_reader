Rails.application.routes.draw do
  root 'sessions#new', as: 'login'

  post    '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
end
