class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
    	t.belongs_to :user, index: true, foreign_key:true
    	t.belongs_to :listing, index: true, foreign_key:true
    	t.date :start_date, null: false
    	t.date :end_date, null: false
    	t.integer :no_of_guests, null: false
      t.timestamps null: false
    end
  end
end
