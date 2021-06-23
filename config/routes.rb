Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :brands, only: [:index, :show] do
    resources :favorites, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  get 'my-favorites', to: 'favorites#display'
end
