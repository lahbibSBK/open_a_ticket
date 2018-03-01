Rails.application.routes.draw do
  get 'mentor_profils/new'

  get 'mentor_profils/create'

  get 'mentor_profils/update'

  get 'mentor_profils/destroy'

  get 'mentor_profils/show'

  get 'mentor_profils/edit'

  get 'mentor_profils/index'

  devise_for :users
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
  get '/tickets/:id/mentor/:mid', to: 'tickets#mentor', as: 'tickets_mentor'
end

