Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :host_users, controllers: {
    sessions:      'host_users/sessions',
    passwords:     'host_users/passwords',
    registrations: 'host_users/registrations'
  }                 
  root "users#index"
  
  resources :users, only: [:index,  :show, :new, :create, :edit, :update]

  resources :host_users, only: [:show, :new, :create, :edit, :update] 
  resources :books, only: [:index, :new, :create, :show] do
    resources :reservations
  end 

  

          
end