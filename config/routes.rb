Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
       resources :vehicle_reports, only: [:show]
    end
   end
   namespace :api do
    namespace :v1 do
      resources :driver_reports, only: [:index]
    end
 end
 namespace :api do
  namespace :v1 do
    resources :vehicle_trip_reports, only: [:show]
  end
end
  resources :refuel_entries
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
get '/vehicle_assignments', to: 'vehicle_assignments#fetch_vehicle_assignments'  
get 'report', to: 'reports#vehicle_report'
get 'report1', to: 'reports#driver_report'
get 'report2', to: 'reports#total_summary'
get 'topvehicle', to: 'reports#top_vehicles'

get 'users', to: 'users#index'  
get 'profile', to: 'drivers#profile'
post '/signup', to: 'users#create'
post '/login', to: 'sessions#create'
get '/me', to: 'application#authorized_user'
delete '/logout', to: 'sessions#destroy'
# options '*path', to: 'application#cors_preflight_check'

# match '/login',controller: 'application', action: 'cors_preflight_check', via: [:options]
  # Defines the root path route ("/")
  # root "articles#index"
end
