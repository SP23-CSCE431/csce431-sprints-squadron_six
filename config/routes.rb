Rails.application.routes.draw do
  devise_for :authusers, controllers: {
    omniauth_callbacks: 'authusers/omniauth_callbacks',
    sessions: 'authusers/sessions',
    registrations: 'authusers/registrations'
  }
  root "main#index"

  resources :performances
  resources :exams
  resources :alumnis
  resources :courses
  resources :companies
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'main', to: 'main#index'
end
