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
    user = User.find_by(name: params[:name].downcase)
    #assign role_name for user
    role = user.role_name

    if user && user.authenticate(params[:password]) && user.activated == true
      #if the user tried to login before activating their account, the update_email
      #session will cause them to only be able to update their email when they update their account
      #here upon logging we clear all update_email sessions because we can be sure
      #they do not need to have the session set for any reason
      session[:update_email] = nil

      #try to break out user roles
      if role == 'Admin'
        session[:user_role_id] = user.role_id
        #the redirect_back_or_default method is defined in the application_controller.rb
        #the method looks for the location of the user prior to logging in. If it finds one
        #then the user will be redirected to the admin url.
        redirect_back_or_default admin_url
      elsif role == 'User'
        session[:user_id] = user.id
        #if there is a cart made by the session, add the user_id to the cart on login
        if Cart.find_by(user_id: user.id)
          @cart = Cart.where(user_id: user.id)
        elsif Cart.find_by(id: session[:cart_id]) && Cart.find(session[:cart_id]).user_id == nil
          @cart = Cart.find(session[:cart_id])
          @cart.update!(:user_id => user.id)
        else
          Cart.create(:user_id => user.id)
        end
        redirect_to homepage_posts_path, notice: "Welcome back, #{User.find_by(id: user.id).name.capitalize}!"
      end
    elsif user && user.authenticate(params[:password])
      #this line of code limits the site to 50,000 users. And assigns a special session_id to allow
      #the user to update only the password of the account in case they actually entered the wrong email
      session[:update_email] = (user.id*50000)
      #redirect_to edit user email path
      redirect_to edit_user_path(user.id), notice: "Please activate account via email. If you have not recieved an email, you may have entered it incorrectly, please update it below"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  #where the fuck do i put this
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def destroy
    #to log out the admin we set session[:user_role_id] to nil
    #OR to log the user out we set the session[:user_id] to nil
    session[:user_role_id] = nil || session[:user_id] = nil
    redirect_back_or_default homepage_posts_path
  end



end
