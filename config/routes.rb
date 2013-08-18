OpenAtRit::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # The home page, which is the list of all Locations
  root 'locations#index'

  # The main resource
  resources :locations, only: [:index, :show]
end
