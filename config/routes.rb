Rails.application.routes.draw do
  root 'foods#index'
  resources :foods
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: :show
  

end
