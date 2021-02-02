Rails.application.routes.draw do
  resources :users
  resources :books
  resources :authors
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
