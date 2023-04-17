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
  resources :custom_foods do
    collection do
      get :fetch_nutrient_data_and_new
    end
  end
  resources :myset_foods
  resources :user_physical_informations
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :users, only: :show
end