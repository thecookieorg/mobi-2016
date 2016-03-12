class Distribution < ActiveRecord::Base
  belongs_to :city
  
  accepts_nested_attributes_for :city
  validates_presence_of :name
end
