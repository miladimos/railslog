module SiteRoutes
    def self.extended(router)
        router.instance_exec do
            root "site/site#index", as: :index

            get "posts", to: "site/posts#posts", as: :posts
            get "posts/:id", to: "site/posts#post", as: :post_show

            get "auth/register", to: "site/auth#register_form", as: :register_form
            post "auth/register", to: "site/auth#register", as: :register

            get "auth/login", to: "site/auth#login_form", as: :login_form
            post "auth/login", to: "site/auth#login", as: :login

            post "auth/logout", to: "site/auth#logout", as: :logout

            get "auth/password/forgot", to: "site/auth#password_forgot_form", as: :password_forgot_form
            post "auth/password/forgot", to: "site/auth#password_forgot", as: :password_forgot


        end
    end
end