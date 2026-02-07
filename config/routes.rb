# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  # get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users
  resources :users
  resources :posts, only: %i[index show new create destroy]
  resources :post_comments, controller: :comments, only: %i[create index]
  resources :post_likes, controller: :likes, only: %i[create destroy]
end
