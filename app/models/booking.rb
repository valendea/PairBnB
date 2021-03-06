class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :no_of_guests, presence: true
	validates :no_of_guests, presence: true, numericality: { greater_than: 0, only_integer: true }
	validate :check_overlapping_dates, on: :create
	validate :start_date_should_be_after_today

	def check_overlapping_dates
		listing.bookings.each do |prev_booking|
			if overlap?(self, prev_booking)
				return errors.add(:overlapping_dates, "The booking dates conflict with existing booking")
			end
		end
	end

	def overlap?(x,y)
		(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
	end

	def total_price
		price = listing.price
		num_dates = (start_date..end_date).to_a.length
		# byebug
		return price * num_dates
	end

	def start_date_should_be_after_today
    if start_date <= Date.today
      errors.add(:start_date, "can't be in the past or today")
    end
  end
end