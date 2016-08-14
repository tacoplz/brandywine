class FurnitureRoomsController < ApplicationController
  #only allow non-admin to access the show method for furniture rooms
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_furniture_room, only: [:show, :edit, :update, :destroy]

  # GET /furniture_rooms
  # GET /furniture_rooms.json
  def index
    @furniture_rooms = FurnitureRoom.all
  end

  # GET /furniture_rooms/1
  # GET /furniture_rooms/1.json
  def show
  end

  # GET /furniture_rooms/new
  def new
    @furniture_room = FurnitureRoom.new
  end

  # GET /furniture_rooms/1/edit
  def edit
  end

  # POST /furniture_rooms
  # POST /furniture_rooms.json
  def create
    @furniture_room = FurnitureRoom.new(furniture_room_params)

    respond_to do |format|
      if @furniture_room.save
        format.html { redirect_to @furniture_room, notice: 'Furniture room was successfully created.' }
        format.json { render :show, status: :created, location: @furniture_room }
      else
        format.html { render :new }
        format.json { render json: @furniture_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /furniture_rooms/1
  # PATCH/PUT /furniture_rooms/1.json
  def update
    respond_to do |format|
      if @furniture_room.update(furniture_room_params)
        format.html { redirect_to @furniture_room, notice: 'Furniture room was successfully updated.' }
        format.json { render :show, status: :ok, location: @furniture_room }
      else
        format.html { render :edit }
        format.json { render json: @furniture_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furniture_rooms/1
  # DELETE /furniture_rooms/1.json
  def destroy
    @furniture_room.destroy
    respond_to do |format|
      format.html { redirect_to furniture_rooms_url, notice: 'Furniture room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furniture_room
      @furniture_room = FurnitureRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def furniture_room_params
      params.require(:furniture_room).permit(:room_type)
    end
end
