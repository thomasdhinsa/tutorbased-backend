Rails.application.routes.draw do
post "/sessions" => "sessions#create"
get "/users" => "users#index"
get "/users/:id" => "users#show"
post "/users" => "users#create"
patch "/users/:id" => "users#update"
delete "/users/:id" => "users#delete"
get "/reviews" => "reviews#index"
post "/reviews" => "reviews#create"
patch "/reviews/:id" => "reviews#update"
delete "/reviews/:id" => "reviews#destroy"
end
