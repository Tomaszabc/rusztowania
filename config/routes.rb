# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admin_users,
             ActiveAdmin::Devise.config.merge({ class_name: 'AdminUser',
                                                controllers: { sessions: 'custom_active_admin_sessions' } })

  ActiveAdmin.routes(self)
  devise_for :users, skip: :registrations
  get '/pages/index', to: 'pages#index'
  resources :parts
  resources :cart_items, only: [:create]
  resources :carts do
    resources :cart_items, only: %i[create update destroy]
    member do
      delete 'clear_cart'
    end
  end

  get 'orders/lager_order', to: 'orders#lager_order', as: 'lager_order'
  post 'orders/create_lager_order', to: 'orders#create_lager_order', as: 'create_lager_order'

  resources :orders, only: %i[new create show update edit] do
    member do
      get :complete
      get :set_to_pending
      get :set_to_missing_parts
      post :add_part
      delete :delete_part
      get :set_to_hide
      get :set_to_visible
    end
  end

  root 'pages#welcome'

  get '/get_full_address', to: 'orders#get_full_address'

  namespace :warehouse do
    resources :storages, only: %i[index show update] do
      member do
        # ... (inne akcje member)
        get :print
      end

      collection do
        get :completed_orders
        get :pending_orders
        get :in_progress_orders
        get :all_orders
        get :search_orders
        get :missing_parts_orders
        get 'parts_on_site'
        get :hidden_orders
        get :visible_orders
        get :print
      end
    end
  end

  namespace :tracking do
    resources :orders do
      collection do
        get :completed_orders
        get :pending_orders
        get :in_progress_orders
        get :all_orders
        get :search_orders
        get :missing_parts_orders
        get :your_orders
      end
    end
  end
end
