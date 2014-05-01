Bman::Application.routes.draw do
  root 'site#index'

  resources :users
end
