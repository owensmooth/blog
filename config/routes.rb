Rails.application.routes.draw do
  get "/signup", to: "users#new"

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    get '/', action: :index, controller: 'dashboard'
    resources :articles, :comments, :users
  end

  resources :users
  resources :about

  root "articles#index"
end
