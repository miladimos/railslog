class Site::AuthController < ApplicationController
    def register_form
        @user = User.new
    end
    
    def register
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to index_path
        else
            render :register_form
        end
    end

    private def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
    def login_form
    end
    
    def login
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to site_path
        else
            "Invalid password or email"
        end
    end
    
    def logout
        session[:user_id] = nil
    end
end