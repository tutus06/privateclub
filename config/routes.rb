Rails.application.routes.draw do
  get '/', to: 'static_pages#home'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
