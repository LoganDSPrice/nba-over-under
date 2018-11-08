Rails.application.routes.draw do
  resources :teams
  resources :picks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"

  resources :contestants
end
