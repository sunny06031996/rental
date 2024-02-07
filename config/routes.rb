Rails.application.routes.draw do
 
  root "logins#new"
  resources :logins, only: [:new]
  namespace :logins do
    post 'login'
  end

  resources :registrations, only: [:create,:index]
  resources :users, only: [:index]
  resources :properties
  resources :favorites, only: [:create, :destroy]
end
