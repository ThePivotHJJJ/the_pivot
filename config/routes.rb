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

  resources :shops, only: [:index, :show]

  namespace :shop do
    resources :items, only: [:show]
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
end
