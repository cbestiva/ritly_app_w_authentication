RitlyApp::Application.routes.draw do

  resources :users, :sessions
  
  # get "sessions/new"
  # get "sessions/destroy"
  # get "users/new"
  # get "users/show"
  # get "users/create"
  root to: "urls#index"

  # default route that displays the index erb
  get "/urls", to: "urls#index", as: :urls

  # default route that calls the method to
  # create a url
  post "/urls", to: "urls#create"

  # route that displays the show erb
  # after the url has been created
  get "/urls/:id", to: "urls#show", as: :url

  # route that shows table of all links created
  get "/go/all_links", to: "urls#display_links", as: :all_urls

  # route that displays the
  # URL page using the random string code
  get "/go/:random_string", to: "urls#go_to_link"

  # route that displays what
  # URL the redirect will lead to
  get "/go/:random_string/preview", to: "urls#preview"

  delete "/go/all_links", to: "urls#destroy", as: :url_delete

  get "/signup" => "users#new"
  delete "/signout", to: "sessions#destroy"
  get "/signin" => "sessions#new"

end
