Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :geolocations, only: [:create]
  get 'geolocations', to: 'geolocations#show'
  delete 'geolocations', to: 'geolocations#destroy'
end
