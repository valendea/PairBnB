class ChangeColumnsForListing < ActiveRecord::Migration[5.1]
  def change
  	change_column :listings, :house_rules, :string
  end
end
