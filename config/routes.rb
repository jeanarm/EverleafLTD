Rails.application.routes.draw do
  root 'sessions#new'
  resources :usrs
  namespace :admin do
  resources :usrs
  end
  resources :labelings
  resources :labels
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # root 'tasks#index'
  resources :tasks
  
  resources :sessions
  # devise_for :users, controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
