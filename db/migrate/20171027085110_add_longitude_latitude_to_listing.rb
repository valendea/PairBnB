class AddLongitudeLatitudeToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :longitude, :float, default: 0
    add_column :listings, :latitude, :float, default: 0
  end
end