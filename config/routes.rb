Bman::Application.routes.draw do

  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }

  root 'batman#index'

  scope :api, defaults: { format: :json }, except: [ :new, :edit ] do
    resources :articles
  end
end
