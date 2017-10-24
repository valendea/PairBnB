class AddColumnsForListing < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :description, :string
  	add_column :listings, :price, :integer
  	add_column :listings, :no_of_bathrooms, :integer
  	add_column :listings, :house_rules, :integer
  end
end
