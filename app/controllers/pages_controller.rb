class PagesController < ApplicationController
  def index
    @countries = Country.all
    @cities = City.all
    @distributions = Distribution.all
    @hot_spots = HotSpot.all
    @listings = Listing.all
  end

  def team
  end

  def advertise
  end

  def contact
  end

  def testimonial
  end

  def magazine
  end
end
