Rails.application.routes.draw do
  resources :mining_types
  get 'teste/index'
  resources :coins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "teste#index"
end
