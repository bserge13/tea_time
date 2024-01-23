Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v0 do 
      patch '/customer_subscriptions/cancel_subscription/:id', to: 'customer_subscriptions#cancel_sub'
      get '/customer_subscriptions/:customer_id/subscriptions', to: 'customer_subscriptions#index'
      resources :customers
      resources :customer_subscriptions
      resources :subscriptions
      resources :teas
    end
  end
end
