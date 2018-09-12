Rails.application.routes.draw do
  resources :logins
  resources :controllers
  resources :registers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
