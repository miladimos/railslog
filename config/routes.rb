Rails.application.routes.draw do
  resources :tags

    extend SiteRoutes
    extend WebmasterRoutes
    extend ApiRoutes
end
