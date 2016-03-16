class RemoveIsActiveFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :is_active
  end
end
