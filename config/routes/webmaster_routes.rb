module WebmasterRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :webmaster do
        resources :posts
        resources :tags
        resources :categories
        resources :users
      end
    end
  end
end
