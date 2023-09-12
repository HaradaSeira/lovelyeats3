Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users
  
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  
  resources :items, only: [:new, :create]
  
  resources :users do
    member do
      get :dashboard
      get :shop_new, to: 'shops#new', as: :user_shop_new
      post :shop_create, to: 'shops#create', as: :user_shop_create
      get :item_new, to: 'items#new', as: :user_item_new
    end
  end

  resources :shops, only: [:show] do
    resources :events, only: [:new, :create]
    resources :items, only: [:new, :create] 
  end
end
