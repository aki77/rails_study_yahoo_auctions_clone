Rails.application.routes.draw do
  devise_for :users
  root 'auctions#index'

  resources :users, only: %i(show)
  resources :products do
    resources :auctions, only: %i(new create)
  end

  resources :auctions, only: %i(show) do
    resources :bids, only: %i(new create index)

    collection do
      get 'closed'
    end
  end
end
