class FurnitureStylesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_furniture_style, only: [:show, :edit, :update, :destroy]
  before_action :store_location, only: [:index]
  # GET /furniture_styles
  # GET /furniture_styles.json
  def index
    @furniture_styles = FurnitureStyle.all
  end

  # GET /furniture_styles/1
  # GET /furniture_styles/1.json
  def show
  end

  # GET /furniture_styles/new
  def new
    @furniture_style = FurnitureStyle.new
  end

  # GET /furniture_styles/1/edit
  def edit
  end

  # POST /furniture_styles
  # POST /furniture_styles.json
  def create
    @furniture_style = FurnitureStyle.new(furniture_style_params)

    respond_to do |format|
      if @furniture_style.save
        format.html { redirect_to @furniture_style, notice: 'Furniture style was successfully created.' }
        format.json { render :show, status: :created, location: @furniture_style }
      else
        format.html { render :new }
        format.json { render json: @furniture_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furniture_styles/1
  # PATCH/PUT /furniture_styles/1.json
  def update
    respond_to do |format|
      if @furniture_style.update(furniture_style_params)
        format.html { redirect_to @furniture_style, notice: 'Furniture style was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture_style }
      else
        format.html { render :edit }
        format.json { render json: @furniture_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furniture_styles/1
  # DELETE /furniture_styles/1.json
  def destroy
    @furniture_style.destroy
    respond_to do |format|
      format.html { redirect_to furniture_styles_url, notice: 'Furniture style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture_style
      @furniture_style = FurnitureStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_style_params
      params.require(:furniture_style).permit(:furniture_style, :furniture_style_image)
    end
end
