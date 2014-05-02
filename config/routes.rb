Bman::Application.routes.draw do

  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }

  root 'site#index'

  resources :users
end
