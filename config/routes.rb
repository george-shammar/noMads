Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :opinions do
    resources :likes, only: [:create, :destroy]
  end

  resources :followings, only: [:create, :show, :destroy]
  
  resources :users, only: [:index, :show]

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  

  root 'opinions#index'
end
