Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: %i(show)
  resources :products do
    resources :auctions, only: %i(new create)
  end

  resources :auctions, only: %i(index show)
end
