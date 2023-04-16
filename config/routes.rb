Rails.application.routes.draw do
  root 'daily_records#index'
  resources :foods
  resources :daily_records do
    collection do
      get :about
      get :search
    end
  end
  resources :daily_record_items, only: [:destroy, :update]
  resources :mysets
  resources :custom_foods
  resources :myset_foods
  resources :user_physical_informations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: :show
end