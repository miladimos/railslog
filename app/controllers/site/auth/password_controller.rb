class Site::Auth::PasswordController < ApplicationController
  def forgot_form
  end

  def forgot
    @user = User.find_by(email: params[:email])
    if @user.present?
      ForgotPasswordMailer.with(user: @user).reset.deliver_later
    else
      redirect_to forgot_form_path, alert: "email not found"
    end
  end

  def reset_form
  end

  def reset
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user.present?
      if @user.confirmed?
        @user.send_password_reset_email!
        redirect_to root_path, notice: "If that user exists we've sent instructions to their email."
      else
        redirect_to new_confirmation_path, alert: "Please confirm your email first."
      end
    else
      redirect_to root_path, notice: "If that user exists we've sent instructions to their email."
    end
  end

  def edit
    @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
    if @user.present? && @user.unconfirmed?
      redirect_to new_confirmation_path, alert: "You must confirm your email before you can sign in."
    elsif @user.nil?
      redirect_to new_password_path, alert: "Invalid or expired token."
    end
  end

  def new
  end

  def update
    @user = User.find_signed(params[:password_reset_token], purpose: :reset_password)
    if @user
      if @user.unconfirmed?
        redirect_to new_confirmation_path, alert: "You must confirm your email before you can sign in."
      elsif @user.update(password_params)
        redirect_to login_path, notice: "Sign in."
      else
        flash.now[:alert] = @user.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Invalid or expired token."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
