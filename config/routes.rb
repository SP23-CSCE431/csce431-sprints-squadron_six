Rails.application.routes.draw do
  resources :exams
  resources :performances
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "main#index"

  resources :users
  get 'main', to: 'main#index'
  
end
