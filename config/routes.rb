Rails.application.routes.draw do
  root "main#index"
  
  resources :performances
  resources :exams
  resources :alumnis
  resources :courses
  resources :companies
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
