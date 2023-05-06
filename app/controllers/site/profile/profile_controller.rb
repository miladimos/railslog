class Site::Profile::ProfileController < ApplicationController
  def profile
    @user = params[:username]
    render "site/profile/profile"
  end
end
