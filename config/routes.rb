Rails.application.routes.draw do
  get 'payments/new'

  get 'orders/show'


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets do
    resources :reviews, only: [:index, :new, :create]
    member do
      patch :assign_mentor
    end
  end


  resources :mentor_profils do
    resources :reviews, only: [:show, :edit, :index]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end


  get '/dashboard', to: 'tickets#index', as: 'dashboard'
  get '/tickets/:id/mentor/:mid', to: 'tickets#mentor', as: 'tickets_mentor'
  post '/tickets/:id/close', to: 'tickets#close', as: 'close_ticket'
end

