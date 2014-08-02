Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'events#index'
  	resources :events
  end
end
