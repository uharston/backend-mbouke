Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'workers', to: 'workers#create'
  get 'profile', to: 'workers#show'
  post 'login', to: 'sessions#login'
end
