# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :users
  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[create index]
    resources :likes, only: %i[create destroy]
  end
end
