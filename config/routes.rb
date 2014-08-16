Rails.application.routes.draw do
  devise_for :users

  root to: "events#index"

  resources :events, only: [:index] do
    resources :awards
  end

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :teams
  end
end
