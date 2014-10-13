Rails.application.routes.draw do
  resources :payloads, only: :create

  root to: 'health_check/index'
end
