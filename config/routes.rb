Rails.application.routes.draw do

  get 'dashboard/index'
  resources :user, except:[:destroy]
  get 'user/index' => 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  resources :movie, only: [:show] do
    member do
      post 'save_favorite'
    end
  end

  resources :actor, only: [:show]

  get 'home/index'
  root 'dashboard#index'
end
