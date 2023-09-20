Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users
  
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  get '/users/profile', to: 'users#profile', as: :user_profile
  get '/shops/profile', to: 'shops#profile'
  
  resources :items, only: [:new, :create, :edit, :update, :destroy, :show]

  resources :items do
    post 'favorites', to: 'favorites#create', on: :member
  end
  
  resources :favorites, only: [:create, :destroy]

  resources :users do
    member do
      get :dashboard
      get :shop_new, to: 'shops#new', as: :user_shop_new
      post :shop_create, to: 'shops#create', as: :user_shop_create
      get :item_new, to: 'items#new', as: :user_item_new
    end
  end

  resources :shops do
    resources :events #
    resources :items, only: [:new, :create] 
  end
end
