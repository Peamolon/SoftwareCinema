Rails.application.routes.draw do

  get 'cinema_place/index'
  get 'cinema_place/show'
  get 'cinema_place/new'
  resources :movies do
    resources :califications
  end
  resources :products
  resources :multiplexes do
    resources :cinemas do
      resources :cinema_place
      resources :product_orders, except: [:show, :index]
    end
  end
  resources :product_orders, only: [:show, :index]
  resources :employees
  resources :clients
  get 'welcome/index'
  root to: 'welcome#index'
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
