class ListingsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    #@listings = Listing.all
    #if params[:hot_spots].blank?
    @city = City.all
    if params[:hot_spot].blank?
      @listings = Listing.all
      @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
        marker.lat listing.latitude
        marker.lng listing.longitude
        marker.infowindow "<h4>#{listing.name}</h4><p><b>Address:</b> #{listing.address}</p><p><b>Phone:</b> #{listing.phone}</p><p><b>Website:</b> #{listing.website}</p>"
        marker.json({
            name:     listing.name,
            address: listing.address
          })
        marker.picture({
                      anchor: [0, 0],
                      url: "http://thecookiedining.com/mobimaps-pin.png",
                      width: "64",
                      height: "64"
                 })
      end
    else
      #@hot_spot_id = HotSpot.find_by(name: params[:hot_spot]).id
      @hot_spot_id = HotSpot.find_by(name: params[:hot_spot]).id
      @listings = Listing.where(hot_spot_id: @hot_spot_id).order("created_at DESC")
      @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
        marker.lat listing.latitude
        marker.lng listing.longitude
        marker.infowindow "<h4>#{listing.name}</h4><p><b>Address:</b> #{listing.address}</p><p><b>Phone:</b> #{listing.phone}</p><p><b>Website:</b> #{listing.website}</p>"
        marker.json({
            name:     listing.name,
            address: listing.address
          })
        marker.picture({
                      anchor: [0, 0],
                      url: "http://thecookiedining.com/mobimaps-pin.png",
                      width: "64",
                      height: "64"
                 })
      end
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @hash = Gmaps4rails.build_markers(@listing) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow "<b>#{listing.name}</b>"
      marker.picture({
                      anchor: [0, 0],
                      url: "http://thecookiedining.com/mobimaps-pin.png",
                      width: "64",
                      height: "64"
                 })
    end
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :address, :phone, :website, :latitude, :longitude, :hot_spot_id, :city_id, :is_active)
    end
end
