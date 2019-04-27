Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments
  end

  resources :tags, only: [:index, :show, :destroy]

  resources :authors

  resources :author_sessions, only: [:new, :create, :destroy]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
