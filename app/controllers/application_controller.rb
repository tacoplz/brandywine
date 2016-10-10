class ApplicationController < ActionController::Base
#intercepts all calls to actions in the admin controller
#check to see that session(:user_id) is set and corresponds to a user_id
#in the database before allowing access. before action causes the authorize
#method to be invoked before every action in our application
#if we dont require a user to be admin we can add the skip_before_action :authorize
  before_action :authorize

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #this is for ajax to populate furniture types based off room selection
  respond_to :html, :xml, :json, :js

#unless the user session(:user_id) is set we do not authorize the admin
#access but instad redirect to the login_url
  protected
    def authorize
      unless User.find_by(role_id: session[:user_role_id])
        redirect_to login_url, notice: "Admin login required"
      end
    end

    #require access for authorized users
    def authorize_user
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please Log In"
      end
    end

    #this stores the users location prior to logging in, it must be called within
    #each individual controller to save the location. If the user location is not saved
    #the user will be redirect_to the admin_url (control panel)
    def store_location
      session[:return_to] = request.url
    end
    #this function allows the user to be redirect_to to store_location (if it is
    #something that was set in the controller) or will redirect_to the admin url
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default, alert: "Login Successful, Welcome Back!")
      session[:return_to] = nil
    end

end
