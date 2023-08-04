Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config.merge({class_name: 'AdminUser', controllers: {sessions: 'custom_active_admin_sessions'}})


  ActiveAdmin.routes(self)
  devise_for :users, skip: :registrations
   get '/pages/index', to: 'pages#index'
  resources :parts
  resources :cart_items, only: [:create]
  resources :carts do
   resources :cart_items, only: [:create, :update, :destroy]
    member do
      delete 'clear_cart'
    end
  end
  
  resources :orders, only: [:new, :create, :show] do
    member do
      get :complete
    end
  end
 
   root "pages#welcome"

   get "/get_full_address", to: "orders#get_full_address"
  
   namespace :warehouse do
    resources :storages, only: [:index, :show, :update]
    # inne ścieżki
  end
  
end
