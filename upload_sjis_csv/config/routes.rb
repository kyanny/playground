Rails.application.routes.draw do
  resources :welcomes
  root 'welcomes#index'
end
