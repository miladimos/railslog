module SiteRoutes
    def self.extended(router)
        router.instance_exec do
            root "site/site#index", as: :index

            get "posts", to: "site/site#posts", as: :posts
            get "posts/:id", to: "site/site#post", as: :post_show

            get "auth/register", to: "site/auth#register_form", as: :register_form
            post "auth/register", to: "site/auth#register", as: :register

            get "auth/login", to: "site/auth#login_form", as: :login_form
            post "auth/login", to: "site/auth#login", as: :login

            post "auth/logout", to: "site/auth#logout", as: :logout
        end
    end
end