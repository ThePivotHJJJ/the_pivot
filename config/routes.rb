Rails.application.routes.draw do
  get 'shops/index'

  root to: "gifs#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  get "/dashboard", to: "users#show"

  namespace :admin do
    get "/dashboard", to: "users#show"
    resources :orders, only: [:index, :update, :show]
    resources :gifs, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :shops, only: [:index]

  resources :cart_gifs, only: [:create]
  get "/cart", to: "cart_gifs#show"
  delete "/cart", to: "cart_gifs#destroy"
  patch "/cart", to: "cart_gifs#update"

  resources :orders, only: [:index, :show, :create, :new]

  resources :items, only: [:index]

  put "/retire", to: "gifs#update"

  resources :charities, only: [:index, :show]

  resources :tags, only: [:index]
  get "/tag/:name", :to => "tags#show", as: :tag

  resources :charges
end
