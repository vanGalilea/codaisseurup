Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :themes
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :users, only: [:show]
  resources :events do
    resources :registrations, only: [:create]
  end

  namespace :api do
    resources :events
  end

  resources :photos

  get "about" => "pages#about"
  get "terms" => "pages#terms"

end
