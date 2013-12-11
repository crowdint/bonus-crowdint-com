BonusBatch::Application.routes.draw do
  devise_scope :user do
    get 'google_apps_sign_in', to: 'crowdint_auth/omniauth_callbacks#google_apps_sign_in'

    root to: 'devise/sessions#new'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  resources :bonuses
  resources :batches
  resources :organizations
  resources :users

  post 'invitations', to: 'invitations#create', as: 'invitations'
  get '/invitations/:organization_id', to: 'invitations#show'

  get '/my-organizations(/*organizations)' => 'dashboard#index'

  resources :dashboard, only: :index


end
