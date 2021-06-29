Rails.application.routes.draw do
  root to: "home#index"

  resources :conversations, only: :create
end
