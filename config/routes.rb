Rails.application.routes.draw do

  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :properties
  resources :property_images, only: :destroy

end
