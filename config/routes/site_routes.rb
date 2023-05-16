module SiteRoutes
  def self.extended(router)
    router.instance_exec do
      root "site/site#index", as: :index

      scope module: "site" do
        get "posts", to: "posts#posts", as: :posts
        get "posts/:id", to: "posts#post", as: :posts_show

        get "categories", to: "site#categories", as: :categories

        scope module: "auth" do
          get "auth/register", to: "register#register_form", as: :register_form
          post "auth/register", to: "register#register", as: :register

          get "auth/login", to: "login#login_form", as: :login_form
          post "auth/login", to: "login#login", as: :login

          post "auth/logout", to: "login#logout", as: :logout

          get "auth/password/forgot", to: "password#forgot_form", as: :password_forgot_form
          post "auth/password/forgot", to: "auth#password_forgot", as: :password_forgot

          get "auth/password/reset/:token", to: "password#reset_form", as: :password_reset_form
          post "auth/password/reset", to: "password#reset", as: :password_reset
        end

        get "@:username", to: "profile/profile#profile", as: :user_profile
        # get "setting", to: "profile/posts#new"
        get "profile/posts/new", to: "profile/posts#new", as: :posts_new
        post "profile/posts/new", to: "profile/posts#create", as: :posts_create
      end
    end
  end
end
