Bman::Application.routes.draw do

  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }

  root 'batman#index'

  scope defaults: { format: :json }, except: [ :new, :edit ] do
    resources :articles do
      resources :comments
    end
    resources :comments do
      resources :comments
    end
    resources :tags
    resources :users
  end
end
