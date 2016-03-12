class DashboardsController < ApplicationController
  def index
    @countries = Country.all
    @cities = City.all
    @distributions = Distribution.all
    @hot_spots = HotSpot.all
    @listings = Listing.all
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.picture({
                      anchor: [0, 0],
                      url: "http://thecookiedining.com/mobimaps-pin.png",
                      width: "64",
                      height: "64"
                 })
    end
  end
end
