Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :brands, only: [:index, :show] do
    get '/brand_analyse', to: "nlps#analyse"
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:new, :create]
  end

  get 'my-favorites', to: 'favorites#display'

  get 'how-we-rate', to: 'pages#rate'

  resources :requests, only: [:create]
end
