Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :brands, only: [:index, :show]

end
