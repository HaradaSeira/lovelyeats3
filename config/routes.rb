Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users
  
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  
 resources :users do
   member do
     get :dashboard
     get :shop_new, to: 'shops#new', as: :user_shop_new
     post :shop_create, to: 'shops#create', as: :user_shop_create
   end
 end

  resources :shops, only: [:create, :show, :update, :destroy] do
   resources :events, only: [:new, :create]
  # Add a route for showing a specific shop's details
  get :show, on: :member
 end
 
 resources :shops do
  resources :events
 end
end