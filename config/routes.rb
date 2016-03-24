Rails.application.routes.draw do
  root to: "static_pages#landing"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
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

  resources :items, only: [:index, :show]

  put "/retire", to: "items#update"

  resources :tags, only: [:index]
  get "/tag/:name", :to => "tags#show", as: :tag

  resources :charges

  resources :shops, only: [:index]
  get "/:shop", to: "shops#show", as: :shop
  namespace :shops, path: ":shop", as: :shop do
    resources :items, only: [:index, :show]
  end
end
