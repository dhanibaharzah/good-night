Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/sleep_tracker", to: "sleep_tracker#index"
  post "/clock_in", to: "sleep_tracker#create"

  # Defines the root path route ("/")
  # root "articles#index"
end
