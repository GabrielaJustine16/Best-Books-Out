Rails.application.routes.draw do
  get '/' => 'sessions#welcome' #take us to a route called welcome
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  #already a route for post users to users create thats resource users
  resources :reviews
  resources :books
  resources :authors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
