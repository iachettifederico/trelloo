# frozen_string_literal: true

Rails.application.routes.draw do
  root "boards#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, only: %i[index show]
  resource :sorting, only: %i[create]

  get "lalala/:id/:new_name" => "tasks#update"
end
