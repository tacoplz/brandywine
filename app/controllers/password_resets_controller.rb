class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to homepage_posts_path, notice: "Email sent with password reset instructions"
    else
      redirect_to new_password_reset_path, notice: "Error: Email address not found"
    end
  end

  def edit
  end
end
