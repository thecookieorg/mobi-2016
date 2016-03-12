class HotSpot < ActiveRecord::Base
    belongs_to :city
    has_many :listings
    
    accepts_nested_attributes_for :city
end
