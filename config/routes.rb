Rails.application.routes.draw do
  get 'dashboard/index'
  resources :user, except:[:destroy]
  get 'user/index' => 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users

  get 'home/index'
  root 'dashboard#index'
end
