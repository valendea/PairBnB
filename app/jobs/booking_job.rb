class BookingJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later
  # end

  def perform(cust_email, host_email, listing_id, booking_id)
     BookingMailer.notification_email(cust_email, host_email, listing_id, booking_id).deliver_now
  end

end
