# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboards#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users
  resources :users
end
