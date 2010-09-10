Tickets::Application.routes.draw do

  resources :classifications

  resources :assets

  resources :replies

  resource  :user_sessions
  resources :users, :password_resets, :tickets, :companies
  
  match '/login', :to => 'user_sessions#new', :as => :login
  match '/logout', :to => 'user_sessions#destroy', :as => :logout
  match '/reset', :to => 'password_resets#new', :as => :reset
  match '/dashboard', :to => 'static#dashboard', :as => :dashboard

  root :to => 'static#index'
  
  match '/:view', :to => 'static#dashboard'
  match '*path', :to => 'static#index'

end
