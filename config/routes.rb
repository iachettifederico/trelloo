# frozen_string_literal: true

Rails.application.routes.draw do
  root "boards#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, only: %i[index show]
end
