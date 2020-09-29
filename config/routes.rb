Rails.application.routes.draw do
  devise_for :users

  resources :gifs

  root to: 'gifs#index'

  # Wildcard. Any other route goes here
  get "*tag", to: 'gifs#random', as: :random_gif
end
