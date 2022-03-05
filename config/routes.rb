Rails.application.routes.draw do

  root 'invoices#index'
  
  get 'logout', to: 'sessions#destroy'
  resources :users, only: [:create, :new]
  resources :sessions, only: [:create, :new]
  
  resources :invoices, only: [:create, :index, :new]
  
end
