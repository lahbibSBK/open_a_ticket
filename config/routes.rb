Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tickets do
    resources :reviews, only: [:index, :new, :create ]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end
