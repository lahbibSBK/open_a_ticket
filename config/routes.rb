Rails.application.routes.draw do
  resources :mentor_profils

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets do
    resources :reviews, only: [:index, :new, :create]
  end


  resources :mentor_profils do
    resources :tags, only: [:index, :new, :create]
    resources :tags do
      resources :skills, only: [:index, :new, :create]
    end
    resources :reviews, only: [:show, :edit, :index]
    resources :skills, only: [:show, :edit, :update, :destroy]
  end

  get '/dashboard', to: 'tickets#index'
end

