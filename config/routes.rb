Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users
  
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  
  end