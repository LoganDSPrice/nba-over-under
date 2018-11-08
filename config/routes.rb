Rails.application.routes.draw do
  resources :picks
  resources :teams
  resources :contestants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
end
