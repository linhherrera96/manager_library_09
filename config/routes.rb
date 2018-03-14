Rails.application.routes.draw do

  get "books/show"
  get "books/new"

  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users	
  resources :authors
  resources :books
end
