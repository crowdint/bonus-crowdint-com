Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "events#index"

  resources :events, only: [:index] do
    resources :awards
  end

  namespace :admin do
    root to: 'events#index'
    resources :events
    resources :teams do
      resources :memberships
    end
  end
end
