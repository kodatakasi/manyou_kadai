Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  get 'search', to: 'tasks#search'
end
