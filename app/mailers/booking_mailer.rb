class BookingMailer < ApplicationMailer
	def booking_email(user, url, booking_id)
  	@user = user
  	@url = 'http://localhost:3000/sign_in'
  	mail(to: @user.email, subject: 'Someone has booked your listing')
  end
end
