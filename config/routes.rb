Rails.application.routes.draw do
  root to: 'animals#index'
  resources :animals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
