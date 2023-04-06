Rails.application.routes.draw do
  # get 'adminuser/index'
  # get 'adminuser/show'
  # get 'adminuser/new'
  # get 'adminuser/edit'
  # devise_for :users
  devise_for :authusers,
             controllers: {
               omniauth_callbacks: 'authusers/omniauth_callbacks',
               sessions: 'authusers/sessions',
               registrations: 'authusers/registrations'
             }
  root 'main#index'

  resources :performances
  resources :exams
  resources :alumnis
  resources :courses
  resources :companies
  resources :users
  resources :adminusers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'main', to: 'main#index'
  get '/alumni_help', to: 'alumni_help#index'
  get '/user_help', to: 'user_help#index'
  get '/company_help', to: 'company_help#index'
  get '/exam_help', to: 'exam_help#index'
  get '/course_help', to: 'course_help#index'
  get '/performance_help', to: 'performance_help#index'
  get '/adminpage_help', to: 'adminpage_help#index'
end
