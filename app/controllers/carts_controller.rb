class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :store_location
  skip_before_action :authorize, only: [:create, :new, :show, :destroy, :empty, :update]
  #before_action :authorize_user, only: [:show]
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  def empty
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        #add the user_id to cart table if user is logged in prior to starting thier cart
        #if session[:user_id]
        #  @session = session[:user_id]
        #  @cart.update!(:user_id => User.find_by(id: @session).id)
        #end

        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update

    #add the user_id to cart table if user logs in or signs up after starting
    #their cart. The user must click update cart to do this.
    #if session[:user_id]
    #  @session = session[:user_id]
    #  @cart.update!(:user_id => User.find_by(id: @session).id)
    #end

    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      if session[:user_id]
        @cart = Cart.find_by(user_id: session[:user_id])
      else
        @cart = Cart.find(params[:id])
      end
      #add the user_id to cart table if user is logged in prior to starting their cart
      #if session[:user_id]
      #  @session = session[:user_id]
      #  @cart.update!(:user_id => User.find_by(id: @session))
      #end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {}).permit(:user_id)
    end
end
