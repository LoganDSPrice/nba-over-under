Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)
  
  devise_for :users, skip: [:registrations]
  root "seasons#show_active_season"

  resource :my_picks, only: :show
  resource :all_picks, only: :show
  resources :picks, only: [:update] do 
    resource :lock
  end
  resources :seasons do 
    resources :season_lines, only: [:index]
  end

end
