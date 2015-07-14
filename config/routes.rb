Rails.application.routes.draw do

  root "restaurants#index"

  resources :users

  resources :restaurants, only: [:new, :create, :edit] do
    # route is nested (will get a restaurant_id in the params)
    # but the controller is not nested (will just use ItemsController or OrdersController)
    resources :orders
    resources :items
  end

  get '/:slug' => 'restaurants#show', as: :restaurant

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :orders, only: [:new, :create, :show]

  patch 'admin/order/:id/cancel' => 'admin/orders#cancel',   as: :cancel_order
  patch 'admin/pay/:id/pay'      => 'admin/orders#pay',      as: :pay_order
  patch 'admin/pay/:id/complete' => 'admin/orders#complete', as: :complete_order

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  get     '/cart'             => 'carts#show',              as: :cart
  get     '/add_to_cart'      => 'carts#add_to_cart_view',  as: :add_to_cart

  get     '/cart/edit'        => 'carts#edit',              as: :edit_cart
  patch   '/cart'             => 'carts#update'
  put     '/cart'             => 'carts#update'
  post    '/cart/items'       => 'cart_items#create',       as: :cart_items
  delete  '/cart/items'       => 'cart_items#destroy',      as: :cart_items_destroy

  put     '/admin/retire/item'      => 'admin/retire_item#update'

  get     '/order_items/new'  => 'order_items#new',         as: :new_order_item
  post    '/order_items'      => 'order_items#create',      as: :order_items

# consolidate with welcome controller/move to application controller?
  get     '/about_us'          => 'about_us#index'

  namespace :admin do
    # resources :admin
    # namespace refers to a module (in this case Admin)
    # namespace-nested controllers will be within that ruby module
    # i.e. Admin::ItemsController
    resources :items
    resources :categories
    resources :orders do
      resources :order_items do
        get :increment, on: :member
        get :decrement, on: :member
      end
    end
  end

  match '/admin_dashboard',  to: 'admin/admin#show',  via: 'get'
end
