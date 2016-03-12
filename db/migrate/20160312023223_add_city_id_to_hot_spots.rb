class AddCityIdToHotSpots < ActiveRecord::Migration
  def change
    add_reference :hot_spots, :city, index: true, foreign_key: true
  end
end
