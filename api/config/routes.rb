Rails.application.routes.draw do
  resources :states
  resources :countries
  resources :people
  resources :registers
  post '/authenticate', to: 'login#authenticate'
  post '/form', to: 'forms#submit'
  get 'states/statesByCountry/:id', to: 'states#statesByCountry'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
