Rails.application.routes.draw do
  root to: "home#index"
  
  devise_for :users
  
  mount RailsAdmin::Engine => 'admin', as: 'rails_admin'
  
  get 'user_dashboard', to: 'users#dashboard', as: :user_dashboard
  
resources :users do
  member do
    get :dashboard
    get :shop_new, to: 'shops#new', as: :user_shop_new
  end
end

resources :shops, only: [:create]
end