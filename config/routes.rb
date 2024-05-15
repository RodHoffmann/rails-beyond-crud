Rails.application.routes.draw do
  get 'reviews/new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :restaurants do

    resources :reviews, only: [:new, :create]

    collection do
      get :top
      # /restaurants/top
    end

    member do
       # /restaurants/:id/chef
      get "chef"
    end
  end
  # /reviews/:id
  resources :reviews, only: [:destroy]
end
