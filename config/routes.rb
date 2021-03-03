Rails.application.routes.draw do
  root 'sessions#home'
  get '/auth/:provider/callback' , to: 'sessions#omniauth'
  get '/signup' =>  'users#new'
  post '/signup'=>  'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/users/most_reviews' => 'users#most_reviews'

  
  resources :authors do 
    resources :books, only: [:new, :create, :index]
   end 
  resources :genres 
  resources :users do 
    resources :reviews, only: [:index]
  end 
  resources :books 
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
