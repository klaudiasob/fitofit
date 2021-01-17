# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :activities, only: %i[index new create]
  root to: 'activities#index'
end
