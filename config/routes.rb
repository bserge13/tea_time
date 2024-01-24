Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v0 do 
      resources :customer_subscriptions
      patch '/customer_subscriptions/cancel_subscription/:customer_sub_id', to: 'customer_subscriptions#cancel_sub'
      get '/customer_subscriptions/:customer_id/subscriptions', to: 'customer_subscriptions#index'
      
      # this refactor is sending failures in expected responses. Would be a factor area 
      # for me with more time. Errors are- expecting response to be a 401 but returning a 404 instead.
      
      # resources :customer_subscriptions do 
      #   patch 'cancel_subscription/:id', to: 'customer_subscriptions#cancel_sub'
      #   get ':customer_id/subscriptions', to: 'customer_subscriptions#index'
      # end 
    end
  end
end
