Rails.application.routes.draw do
  root "contestants#index"

  resources :contestants
  resources :picks
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
