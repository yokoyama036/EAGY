Rails.application.routes.draw do
  root 'daily_records#index'
  resources :foods
  resources :daily_records do
    collection do
      get :about
    end
  end
  resources :mysets
  resources :myset_foods
  resources :user_physical_informations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: :show
  
end