Rails.application.routes.draw do

  resources :points
  resources :users

  resources :budgets
  devise_for :authusers, controllers: {
    omniauth_callbacks: 'authusers/omniauth_callbacks',
    sessions: 'authusers/sessions',
    registrations: 'authusers/registrations'
  }
  resources :exams
  resources :performances
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "main#index"

  resources :users
  resources :alumnis
  
end
