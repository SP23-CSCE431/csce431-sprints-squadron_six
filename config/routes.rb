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
  get 'alumni_help', to: 'alumnis#alumni_help'
  get 'admin_help', to: 'adminusers#admin_help'
  get 'company_help', to: 'companies#company_help'
  get 'course_help', to: 'courses#course_help'
  get 'exam_help', to: 'exams#exam_help'
  get 'performance_help', to: 'performances#performance_help'
end
