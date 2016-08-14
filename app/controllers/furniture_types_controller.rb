class FurnitureTypesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show, :show_furniture_types]
  before_action :set_furniture_type, only: [:show, :edit, :update, :destroy]

  # GET /furniture_types
  # GET /furniture_types.json
  def index
    @furniture_types = FurnitureType.all
  end

  # GET /furniture_types/1
  # GET /furniture_types/1.json
  def show
  end

  # GET /furniture_types/new
  def new
    @furniture_type = FurnitureType.new
  end

  # GET /furniture_types/1/edit
  def edit
  end

  # POST /furniture_types
  # POST /furniture_types.json
  def create

    #define the instance variable @furniture_type (which is an instance of self for the object)
    #as an object of FurnitureType with the accepted params defined in the private section of this file
    @furniture_type = FurnitureType.new(furniture_type_params)
    #since I could not get furniture_room_id to be passed to the controller upon initial object creation
    #define the instance variable @room to be the furniture_room_for_class of the recently created object
    @room = @furniture_type.furniture_room_for_class
    #update! the @furniture_type instance variable to store the furniture_room_id that corresponds for the furniture_room_for_class
    #use the find_by method on the FurnitureRoom table room_type column to do this
    @furniture_type.update!(:furniture_room_id => FurnitureRoom.find_by(room_type: @room).id)

    respond_to do |format|
      if @furniture_type.save
        format.html { redirect_to @furniture_type, notice: 'Furniture type was successfully created.' }
        format.json { render :show, status: :created, location: @furniture_type }
      else
        format.html { render :new }
        format.json { render json: @furniture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furniture_types/1
  # PATCH/PUT /furniture_types/1.json
  def update
    respond_to do |format|
      if @furniture_type.update(furniture_type_params)
        format.html { redirect_to @furniture_type, notice: 'Furniture type was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture_type }
      else
        format.html { render :edit }
        format.json { render json: @furniture_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furniture_types/1
  # DELETE /furniture_types/1.json
  def destroy
    @furniture_type.destroy
    respond_to do |format|
      format.html { redirect_to furniture_types_url, notice: 'Furniture type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #the following is for populating the furniture type select in products.js
  #only show relevant furniture types based on selection of furniture room_type
  def show_furniture_types
    if params[:furniture_room_id]
      @furniture_types = FurnitureType.where(furniture_room_id: params[:furniture_room_id])
    else
      @furniture_types = FurnitureType.all
    end

    respond_with (@furniture_types) do |format|
      format.json { render json: @furniture_types.to_json(:only => [:id, :furniture_room_id, :furniture_class])}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    #the following is for populating the furniture type select in products.js
    def set_furniture_type
      @furniture_type = FurnitureType.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_type_params
      params.require(:furniture_type).permit(:furniture_class, :furniture_room_for_class, :furniture_room_id)
    end
end
