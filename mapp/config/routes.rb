Rails.application.routes.draw do
  
  root 'sessions#new'
  
  get 'sessions/new'

  get 'courses/home'
  
  get 'courses/home'
  
  get 'users/signup'
  
  resources :courses
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/logout',  to: 'sessions#destroy'

  resources :markers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
