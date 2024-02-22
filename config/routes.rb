Rails.application.routes.draw do
  resources :users
  resources :fuel_stations
  resources :fuel_types
  resources :vehicle_assignments
  resources :vehicle_trips
  resources :vehicles
  resources :vehicle_types
  resources :routes
  resources :drivers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
