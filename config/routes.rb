require "sidekiq/web"
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  mount Sidekiq::Web => "/sidekiq"

  root "application#render_404"

  namespace :api do
    namespace :v1 do
      resources :api_keys, only: :create
      resources :weather, only: :index do
        post :schedule, on: :collection
      end
    end
  end

  direct :weather_api do
    "http://api.weatherapi.com/v1/forecast.json"
  end

  match "*unmatched", to: "application#render_404", via: :all
end
