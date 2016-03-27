Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :update, :edit]
  get "/dashboard", to: "users#show"

  namespace :admin do
    get "/dashboard", to: "users#show"
    resources :orders, only: [:index, :update, :show]
    resources :items, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :cart_items, only: [:create]
  get "/cart", to: "cart_items#show"
  delete "/cart", to: "cart_items#destroy"
  patch "/cart", to: "cart_items#update"

  resources :orders, only: [:index, :show, :create, :new]

  resources :items, only: [:index]

  put "/retire", to: "items#update"

  resources :tags, only: [:index]
  get "/tag/:name", :to => "tags#show", as: :tag

  resources :charges

  resources :shops, only: [:index, :new, :create, :edit]
  get "/:shop", to: "shops#show", as: :shop
  patch "/shops/:id", to: "shops#update", as: :update_shop
  namespace :shop, path: ":shop", as: :shop do
    resources :items, only: [:index, :show]
  end

  resources :bids, only: [:create, :destroy]
  get "/dashboard/bids", to: "bids#index", as: :user_bids
end
