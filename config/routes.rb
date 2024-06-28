Rails.application.routes.draw do
  get 'street_details/show'
  get 'pages/about'

  root 'addresses#index'

  resources :addresses, only: [:index, :show]
  resources :parks, only: [:index, :show]
  resources :schools, only: [:index, :show]

  get 'search', to: 'search#index'
  get 'about', to: 'pages#about'
  get 'street_details', to: 'street_details#show', as: 'street_details'

  get 'search/index'
  get 'schools/index'
  get 'schools/show'
  get 'parks/index'
  get 'parks/show'
  get 'addresses/index'
  get 'addresses/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
