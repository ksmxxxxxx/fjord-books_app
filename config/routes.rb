Rails.application.routes.draw do
  devise_for :users, controllers: {resistrations: 'users/resistrations'}
  resources  :books
  resources  :users, only: [:index, :show]
  root to: "books#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
