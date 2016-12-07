class UsersController < ApplicationController
  #this is only if a first user needs created
  #user_total = User.all
  #if user_total.count == 0
  skip_before_action :authorize, only: [:new, :edit, :create, :show, :update, :user_reviews]
  #end
  before_action :authorize_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:last_name, :first_name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    flash[:error] = params[:error] || "Sorry, we couldn't find that page"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    #if admin, allow them to define user role else set default to user
    if session[:user_role_id]
      #since I could not get role_id to be passed to the controller upon initial object creation
      #define the instance variable @role to be the role_name of the recently created object
      @role = @user.role_name
      #update! the @furniture_type instance variable to store the furniture_room_id that corresponds for the furniture_room_for_class
      #use the find_by method on the FurnitureRoom table room_type column to do this
      @user.update!(:role_id => Role.find_by(role_name: @role).id)
    else
      @user.role_name = "User"
      #@role = @user.role_name
      @user.role_id = 2
      #@user.update!(:role_name => @role, :role_id => Role.find_by(role_name: @role).id)
    end

    respond_to do |format|
      if @user.save
        #when a user signs up and is saved to the db, send the welcome/account_activation mail
        UserNotifier.welcome(@user).deliver_now
        #write module to call create method from sessions controller to login the user
        format.html { redirect_to homepage_posts_path, notice: "Thanks for signing up, #{@user.first_name}!\nPlease check your email to activate your account." }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)

        #update the role_id based on the updated role_name
        @role = @user.role_name
        @user.update!(:role_id => Role.find_by(role_name: @role).id)
        #send activation token if need to update email to activate
        if session[:update_email]
          @user.activation_token  = User.new_token
          @user.activation_digest = User.digest(activation_token)
          UserNotifier.welcome(@user).deliver_now
        end
        format.html { redirect_to user_path, notice: "User #{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def user_reviews
    @users = User.all
  end

  def destroy_user_review
    @user = User.find_by(id: params[:id])
    user = @user.id
    User.update(user, :user_review => params[:user_review])
    @user.save
    redirect_to user_reviews_path, notice: "User review was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_image, :name, :password, :password_confirmation, :role_name, :role_id, :first_name, :last_name, :referral, :user_review, :phone_number, :email, :address, :apt_number, :city, :state, :zip_code)
    end
end
