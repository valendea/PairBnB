class BookingMailer < ApplicationMailer

	default from: "valendeatest@gmail.com"

	# def booking_email(user, url, booking_id)
 #  	@user = user
 #  	@url = 'http://localhost:3000/sign_in'
 #  	mail(to: @user.email, subject: 'Someone has booked your listing')
 #  end

  def notification_email(customer, host, listing_id, booking_id)
    @host = User.find_by(email: host)
    # @customer = customer
    @listing = Listing.find(listing_id)
    #once customer reserved a listing, it will send email to the listing host.
    mail(to: host, subject: "Someone has booked your listing!")
  end
end
