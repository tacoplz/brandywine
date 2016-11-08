class PasswordResetsController < ApplicationController
  skip_before_action :authorize
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to homepage_posts_path, notice: "Thanks #{@user.first_name.capitalize}, email sent with password reset instructions"
    else
      flash.now[:notice] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      redirect_to homepage_posts_path, notice: "Password reset, please log in"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  #confirms a valid user
  def valid_user
    #may want to include the function && @user.authenticated?(:reset, params[:id])
    #this would only allow users who requested (are authenticated for) a reset to reset their password
    unless (@user && @user.activated?)
      redirect_to homepage_posts_path, notice: 'Password reset failed, email address not found.'
    end
  end

  # checks the expiration of a reset token
  def check_expiration
    #password_reset_expired definition in the users model
    if @user.password_reset_expired?
      redirect_to new_password_reset_url, notice: 'Password reset has expired'
    end
  end

end
