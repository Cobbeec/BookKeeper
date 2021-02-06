Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup' =>  'users#new'
  post '/signup'=>  'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy' , as: 'logout' 
  resources :authors
  resources :genres
  resources :users
  resources :books
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
