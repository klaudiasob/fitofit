# frozen_string_literal: true

Rails.application.routes.draw do
  resources :activities, only: %i[index new create]
end
