# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :users, only: :show do
    resources :images, only: [:create, :new, :destroy]
  end
end
