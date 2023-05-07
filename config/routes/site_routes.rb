module SiteRoutes
  def self.extended(router)
    router.instance_exec do
      root "site/site#index", as: :index

      scope module: "site" do
        get "posts", to: "posts#posts", as: :posts
        get "posts/:id", to: "posts#post", as: :post_show

        get "categories", to: "site#categories", as: :categories

        scope module: "auth" do
          get "auth/register", to: "register#register_form", as: :register_form
          post "auth/register", to: "register#register", as: :register

          get "auth/login", to: "login#login_form", as: :login_form
          post "auth/login", to: "login#login", as: :login

          post "auth/logout", to: "login#logout", as: :logout

          get "auth/password/forgot", to: "password#forgot_form", as: :password_forgot_form
          post "auth/password/forgot", to: "auth#password_forgot", as: :password_forgot
        end

        get "@:username", to: "profile/profile#profile", as: :user_profile
        get "profile/posts/new", to: "profile/posts#new"
      end

      # resource "profile/posts", to: "site/profile/posts", as: :profile_posts
    end
  end
end
