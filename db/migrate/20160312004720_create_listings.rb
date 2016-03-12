class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.float :latitude
      t.float :longitude
      t.references :hot_spot, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
