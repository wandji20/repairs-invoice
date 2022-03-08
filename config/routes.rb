require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  root 'invoices#index'
  
  get 'logout', to: 'sessions#destroy'
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new]
  
  resources :invoices, only: [:create, :index, :new]
  
end
