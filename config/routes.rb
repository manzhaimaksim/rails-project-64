# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  resources :users, except: [:index] do
    resources :posts, only: %i[new create]
  end

  resources :users, shallow: true do
    resources :posts, only: [:show]
  end

  resources :posts, only: [:index]

  root to: 'posts#index'
end
