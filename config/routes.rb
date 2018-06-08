Rails.application.routes.draw do
  get 'articles/index'

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :articles, :comments
  end

  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
