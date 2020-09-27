Rails.application.routes.draw do
  get '/' => 'sessions#welcome' #take us to a route called welcome
  resources :reviews
  resources :books
  resources :authors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
