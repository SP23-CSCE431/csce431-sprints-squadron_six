Rails.application.routes.draw do
  root "main#index"

  resources :users
  get 'main', to: 'main#index'
  
end
