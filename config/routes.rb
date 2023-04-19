Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/clock_in", to: "sleep_tracker#index"
  post "/clock_in", to: "sleep_tracker#create"
  
  put "/friendships/user/:user_id/:action_type/:friend_id", to: "friendships#actions"

  # Defines the root path route ("/")
  # root "articles#index"
end
