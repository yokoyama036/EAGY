Rails.application.routes.draw do
  root 'daily_records#index'
  resources :foods
  resources :daily_records
  resources :mysets
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: :show
  
end