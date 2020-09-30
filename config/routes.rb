Rails.application.routes.draw do
  resources :medical_histories
  resources :dependents
  root 'home#index'
  
  resources :users

  # defaults format: :json do 
    resources :sessions, only: [:new,:create, :destroy]
  # end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new',  as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  delete 'logout', to: 'sessions#destroy', as: 'logout_delete'

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
