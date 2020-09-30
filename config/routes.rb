Rails.application.routes.draw do
  resources :medical_histories
  get "medical_histories/:user_id/users", to: "medical_histories#get_for_self"
  get "medical_histories/:user_id/deps", to: "medical_histories#get_for_dependents"

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
