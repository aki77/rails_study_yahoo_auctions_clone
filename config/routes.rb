Rails.application.routes.draw do
  devise_for :users
  root 'auctions#index'

  resources :users, only: %i(show) do
    resources :reviews, only: %i(index)
  end

  resources :products do
    resources :auctions, only: %i(new create)
  end

  resources :auctions, only: %i(show) do
    resource :review, only: %i(new create)
    resources :bids, only: %i(new create index)

    collection do
      get 'closed'
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
