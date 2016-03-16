class AddIsListingActiveToListings < ActiveRecord::Migration
  def change
    add_column :listings, :is_active, :boolean, :default => true
  end
end
