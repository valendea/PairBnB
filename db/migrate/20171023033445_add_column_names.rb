class AddColumnNames < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :name, :string
  end
end

# => ["id", "user_id", "title", "property_type", "num_of_rooms", "created_at", "updated_at", "description", "price", "no_of_bathrooms", "house_rules"]
