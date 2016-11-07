class AccountActivationsController < ApplicationController
skip_before_action :authorize
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      redirect_to homepage_posts_path, notice: "Account activated, please log in"
    else
      redirect_to homepage_posts_path, notice: "Invalid activation link"
    end
  end

end
