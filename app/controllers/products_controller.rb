class ProductsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :store_location
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    #display products if room_for_furniture is selected as a query param
    if params[:room_for_furniture]
      @products = Product.where(:room_for_furniture => params[:room_for_furniture])
    end
    #display products if room_for_furniture is selected as a query param
    if params[:furniture_type]
      @products = Product.where(:furniture_type => params[:furniture_type])
    end
    #display furniture style if furniture_style is selected as a query param
    if params[:furniture_style]
      @products = Product.where(:furniture_style => params[:furniture_style])
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :furniture_style, :image, :room_for_furniture, :furniture_type, :furniture_wood, :furniture_stain, :furniture_dimensions)
    end
end
