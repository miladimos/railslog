module ApiRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :api do
        namespace :v1 do
          defaults format: :json do
            get "tags", to: "api/v1/api#tags"
            get "categories", to: "api/v1/api#categories"
            get "posts", to: "api/v1/api#posts"
            get "users", to: "api/v1/api#users"
          end
        end
      end
    end
  end
end
