Rails.application.routes.draw do
  get 'user/show'
  resources :rooms  do
    resources :messages
  end
  get 'rooms/index'
  root 'pages#home'
  devise_for :users
  devise_scope :user do
    get 'users' , to: 'devise/sessions#new'
end
  get 'user/:id', to:'users#show', as: 'user'
end