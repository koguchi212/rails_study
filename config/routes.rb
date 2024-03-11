Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  resources :aims do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
end
