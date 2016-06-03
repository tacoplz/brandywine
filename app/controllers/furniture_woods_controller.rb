class FurnitureWoodsController < ApplicationController
  before_action :set_furniture_wood, only: [:show, :edit, :update, :destroy]

  # GET /furniture_woods
  # GET /furniture_woods.json
  def index
    @furniture_woods = FurnitureWood.all
  end

  # GET /furniture_woods/1
  # GET /furniture_woods/1.json
  def show
  end

  # GET /furniture_woods/new
  def new
    @furniture_wood = FurnitureWood.new
  end

  # GET /furniture_woods/1/edit
  def edit
  end

  # POST /furniture_woods
  # POST /furniture_woods.json
  def create
    @furniture_wood = FurnitureWood.new(furniture_wood_params)

    respond_to do |format|
      if @furniture_wood.save
        format.html { redirect_to @furniture_wood, notice: 'Furniture wood was successfully created.' }
        format.json { render :show, status: :created, location: @furniture_wood }
      else
        format.html { render :new }
        format.json { render json: @furniture_wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furniture_woods/1
  # PATCH/PUT /furniture_woods/1.json
  def update
    respond_to do |format|
      if @furniture_wood.update(furniture_wood_params)
        format.html { redirect_to @furniture_wood, notice: 'Furniture wood was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture_wood }
      else
        format.html { render :edit }
        format.json { render json: @furniture_wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furniture_woods/1
  # DELETE /furniture_woods/1.json
  def destroy
    @furniture_wood.destroy
    respond_to do |format|
      format.html { redirect_to furniture_woods_url, notice: 'Furniture wood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture_wood
      @furniture_wood = FurnitureWood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_wood_params
      params.require(:furniture_wood).permit(:wood_type)
    end
end
