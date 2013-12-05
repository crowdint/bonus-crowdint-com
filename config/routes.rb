BonusBatch::Application.routes.draw do

  resources :bonuses

  resources :batches

  resources :organizations

  devise_scope :user do
    get 'google_apps_sign_in', to: 'crowdint_auth/omniauth_callbacks#google_apps_sign_in'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  root to: 'organizations#index'

end
