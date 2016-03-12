class HotSpotsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  before_action :set_hot_spot, only: [:show, :edit, :update, :destroy]

  # GET /hot_spots
  # GET /hot_spots.json
  def index
    #@hot_spots = HotSpot.all
    @city = City.all
    if params[:city].blank?
      @hot_spots = HotSpot.all
    else
      @city_id = City.find_by(name: params[:city]).id
      @hot_spots = HotSpot.where(city_id: @city_id).order("created_at DESC")
    end
  end

  # GET /hot_spots/1
  # GET /hot_spots/1.json
  def show
  end

  # GET /hot_spots/new
  def new
    @hot_spot = HotSpot.new
  end

  # GET /hot_spots/1/edit
  def edit
  end

  # POST /hot_spots
  # POST /hot_spots.json
  def create
    @hot_spot = HotSpot.new(hot_spot_params)

    respond_to do |format|
      if @hot_spot.save
        format.html { redirect_to @hot_spot, notice: 'Hot spot was successfully created.' }
        format.json { render :show, status: :created, location: @hot_spot }
      else
        format.html { render :new }
        format.json { render json: @hot_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hot_spots/1
  # PATCH/PUT /hot_spots/1.json
  def update
    respond_to do |format|
      if @hot_spot.update(hot_spot_params)
        format.html { redirect_to @hot_spot, notice: 'Hot spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @hot_spot }
      else
        format.html { render :edit }
        format.json { render json: @hot_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hot_spots/1
  # DELETE /hot_spots/1.json
  def destroy
    @hot_spot.destroy
    respond_to do |format|
      format.html { redirect_to hot_spots_url, notice: 'Hot spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hot_spot
      @hot_spot = HotSpot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hot_spot_params
      params.require(:hot_spot).permit(:name, :city_id)
    end
end
