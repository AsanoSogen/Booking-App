Rails.application.routes.draw do

  root "users#index"
  devise_for :host_users, controllers: {
    sessions:      'host_users/sessions',
    passwords:     'host_users/passwords',
    registrations: 'host_users/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :edit, :update]
  resources :host_users, only: [:index, :show, :edit, :update]
end