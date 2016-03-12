class DashboardsController < ApplicationController
  def index
    @countries = Country.all
    @cities = City.all
    @distributions = Distribution.all
    @hot_spots = HotSpot.all
    @listings = Listing.all
  end
end
