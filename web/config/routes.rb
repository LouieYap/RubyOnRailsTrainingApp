Rails.application.routes.draw do
  resources :people
  resources :registers
  resources :users
  get    '/login',   to: 'login#new'
  root 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'
  get 'registers/loadStates/:countryId', to: 'registers#loadStates'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/form', to: 'static_pages#form'
  post '/form', to: 'static_pages#form_submit'
  get '/logout', to: 'static_pages#logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
