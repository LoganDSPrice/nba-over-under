Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [:registrations]
  root "seasons#index"

  resources :picks, only: [:index, :update]
  resources :seasons do 
    resources :season_lines, only: [:index]
  end
end
