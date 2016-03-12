class Listing < ActiveRecord::Base
  belongs_to :hot_spot
  belongs_to :city
  accepts_nested_attributes_for :hot_spot
  
  geocoded_by :address
  after_validation :geocode
end
