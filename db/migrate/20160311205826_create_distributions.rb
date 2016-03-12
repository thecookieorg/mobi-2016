class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :name
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
