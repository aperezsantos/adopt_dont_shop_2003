Rails.application.routes.draw do
  resources :shelters
  get '/pets', to: 'pets#index'
end
