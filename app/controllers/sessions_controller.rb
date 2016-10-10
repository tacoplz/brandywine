class SessionsController < ApplicationController
  skip_before_action :authorize
  #The session controller supports logging in and out
  def new
  end
  #the SessionsController#create action will record something in session to say that
  #an administrator is logged in. This is done by storing the ID of their User object
  #using the key :user_role_id
  #this uses a form not directly associated with a model object, see sessions/new.html.erb for more info
  def create
    user = User.find_by(name: params[:name])
    #assign role_name for user
    role = user.role_name
    if user and user.authenticate(params[:password])
      #try to break out user roles
      if role == 'Admin'
        session[:user_role_id] = user.role_id
        #the redirect_back_or_default method is defined in the application_controller.rb
        #the method looks for the location of the user prior to logging in. If it finds one
        #then the user will be redirected to the admin url.
        redirect_back_or_default admin_url
      elsif role == 'User'
        session[:user_id] = user.id
        redirect_back_or_default user_path(id: user.id)
      end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    #to log out the admin we set session[:user_role_id] to nil
    #OR to log the user out we set the session[:user_id] to nil
    session[:user_role_id] = nil || session[:user_id] = nil
    redirect_back_or_default homepage_posts_path
  end
end
