class Site::Profile::ProfileController < ApplicationController
  def profile
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to index_path
    else
      render "site/profile/profile"
    end
  end
end
