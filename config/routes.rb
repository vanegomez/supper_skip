Rails.application.routes.draw do

  root "restaurants#index"

  namespace :restaurants, as: :restaurant, path: '/:slug.html' do
    resources :users
    resources :orders
    resources :items
  end

  resources :restaurants, only: [:new, :create, :edit]
  get '/:slug.html' => 'restaurants#show', as: :restaurant


  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :orders do #consider rerouting?
    resources :order_items do #where are these methods getting called? consider removing
      get :increment, on: :member
      get :decrement, on: :member
    end
  end

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
    resources :items
    resources :categories
    resources :orders do
      resources :order_items do # maybe remove, where is this getting called? controller hasn't been created for admin
        get :increment, on: :member
        get :decrement, on: :member
      end
    end
  end

  match '/admin_dashboard',  to: 'admin/admin#show',  via: 'get'
end
