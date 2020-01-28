Rails.application.routes.draw do
  
  devise_for :host_users
    root "host_users#show"
    resources :host_users, only: [:show, :edit, :update]
    
  devise_for :users
    root "users#index"
end