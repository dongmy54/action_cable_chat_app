Rails.application.routes.draw do
  root 'messages#index'
  resources :users
  resources :messages

  mount ActionCable.server, at: '/cable'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
