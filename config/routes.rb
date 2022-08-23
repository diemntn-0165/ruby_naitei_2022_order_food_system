Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "static_pages/home"
    get "static_pages/help"
    get "sessions/new"
    get "sessions/create"
    get "sessions/destroy"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
    scope "/carts" do
      get "/", to: "carts#show", as: "carts"
      post "/:id/add-product", to: "carts#create", as: "add_product"
      post "/:id/plus-product", to: "carts#plus_product", as: "plus_product"
      post "/:id/minus-product", to: "carts#minus_product", as: "minus_product"
    end
    resources :orders, only: %i(new create show)
    
    resources :users, only: %i(new create show)
    namespace :admin do
      root to: "static_pages#index"
      resources :static_pages
      resources :products, except: :show
      resources :orders, except: :show
    end
  end
end
