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
end
