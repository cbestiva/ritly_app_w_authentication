RitlyApp::Application.routes.draw do

  root to: "urls#index"

  # default route that displays the index erb
  get "/urls", to: "urls#index", as: :urls

  # default route that call the method to
  # create a url
  post "/urls", to: "urls#create"

  # rout that displays the show erb
  # after the url has been created
  get "/urls/:id", to: "urls#show", as: :url 

  # route that displays the
  # URL page using the random string code
  get "/go/:random_string", to: "urls#go_to_link", as: :url_link


end
