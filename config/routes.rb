Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"

  get 'new_user_registration', to: 'devise/registrations#new'
  post 'user_registration', to: 'devise/registrations#create'
  resources :users, only: :show

  get 'new_prototype_path', to: 'prototypes#new'
  post 'prototypes_path', to: 'prototypes#create'
  get 'prototype_path(prototype.id)', to: 'prototypes#show'
  get 'edit_prototype_path(prototype.id)', to: 'prototypes#edit'
  put 'prototype_path(prototype.id)', to: 'prototypes#update'
  patch 'prototype_path(prototype.id)', to: 'prototypes#update'
  delete 'prototype_path(prototype.id)', to: 'prototypes#destroy'
  resources :prototypes do
    resources :comments, only: :create
  end
end
