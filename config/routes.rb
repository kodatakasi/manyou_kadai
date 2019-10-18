Rails.application.routes.draw do
  root to: 'tasks#index'
  namespace :admin do
    resources :users
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :tasks
  resources :users

  get '*anything' => 'errors#not_found'
end
