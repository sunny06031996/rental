Rails.application.routes.draw do
 
  root "homes#index"

  resources :homes, only: [:index]
  resources :logins, only: [:new]
  namespace :logins do
    post 'login'
  end
  resources :registrations, only: [:create,:index,:new]
  resources :users, only: [:index]
  resources :properties do
    collection do
      get 'search_property'
    end
  end
  resources :favorites, only: [:create, :destroy]
end
