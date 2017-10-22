class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :property_type
      t.integer :num_of_rooms

      t.timestamps
    end
  end
end
