class SessionsController < ApplicationController
  skip_before_action :authorize
  #The session controller supports logging in and out
  def new
  end
#the SessionsController#create action will record something in session to say that
#an administrator is logged in. This is done by storing the ID of their User object
#using the key :user_id
#this uses a form not directly associated with a model object, see sessions/new.html.erb for more info
  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      #the redirect_back_or_default method is defined in the application_controller.rb
      #the method looks for the location of the user prior to logging in. If it finds one
      #then the user will be redirected to the admin url.
      redirect_back_or_default admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end
  #to log the admin out we set the session[:user_id] equal to nil
  def destroy
    session[:user_id] = nil
    redirect_to homepage_posts_url, notice: "You have been logged out"
  end
end
