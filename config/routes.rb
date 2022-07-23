Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, expect: :create do
    member do
      get :followings, :followers
      resources :followings, only: %i(create destroy)
    end
  end
end
