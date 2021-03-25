Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :opinions
  resources :followings, only: [:create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  

  root 'opinions#index'
end
