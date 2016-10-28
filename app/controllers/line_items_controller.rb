class LineItemsController < ApplicationController
  include CurrentCart #include CurrentCart concern/module
  #set_cart sets the value of @cart to the value of the current cart
  before_action :set_cart, only:  [:create] #private method in CurrentCart concern to only create cart
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:create, :show, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    #if session[:user_role_id]
      @line_items = LineItem.all
    #end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    cart = Cart.find_by(user_id: session[:user_id])
    #define product to be the product added to the cart
    product = Product.find(params[:product_id])

    #DELETE THIS? add the user_id to cart table if user logs in or signs up after starting their cart
    #if session[:user_id]
    #  @session = session[:user_id]
    #  @cart.update!(:user_id => User.find_by(id: session[:user_id]).id)
    #end

    @line_item = @cart.line_items.build(product: product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Product was successfully added to list.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Product successfully removed from list.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
