module SiteRoutes
    def self.extended(router)
        router.instance_exec do
            root "site/site#index", as: :index

            get "posts", to: "site/site#posts", as: :posts
            get "posts/:id", to: "site/site#post", as: :post_show

            get "auth/register", to: "site/auth#register_form", as: :register_form
        end
    end
end