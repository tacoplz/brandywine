class FurnitureStainsController < ApplicationController
  before_action :set_furniture_stain, only: [:show, :edit, :update, :destroy]

  # GET /furniture_stains
  # GET /furniture_stains.json
  def index
    @furniture_stains = FurnitureStain.all
  end

  # GET /furniture_stains/1
  # GET /furniture_stains/1.json
  def show
  end

  # GET /furniture_stains/new
  def new
    @furniture_stain = FurnitureStain.new
  end

  # GET /furniture_stains/1/edit
  def edit
  end

  # POST /furniture_stains
  # POST /furniture_stains.json
  def create
    @furniture_stain = FurnitureStain.new(furniture_stain_params)

    respond_to do |format|
      if @furniture_stain.save
        format.html { redirect_to @furniture_stain, notice: 'Furniture stain was successfully created.' }
        format.json { render :show, status: :created, location: @furniture_stain }
      else
        format.html { render :new }
        format.json { render json: @furniture_stain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furniture_stains/1
  # PATCH/PUT /furniture_stains/1.json
  def update
    respond_to do |format|
      if @furniture_stain.update(furniture_stain_params)
        format.html { redirect_to @furniture_stain, notice: 'Furniture stain was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture_stain }
      else
        format.html { render :edit }
        format.json { render json: @furniture_stain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furniture_stains/1
  # DELETE /furniture_stains/1.json
  def destroy
    @furniture_stain.destroy
    respond_to do |format|
      format.html { redirect_to furniture_stains_url, notice: 'Furniture stain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture_stain
      @furniture_stain = FurnitureStain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_stain_params
      params.require(:furniture_stain).permit(:stain_type)
    end
end
