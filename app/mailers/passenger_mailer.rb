class PassengerMailer < ApplicationMailer
    def booking_confirmed
        @passenger = params[:passenger]
        @booking = @passenger.booking
        @flight = @booking.flight
        mail(to: email_address_with_name(@passenger.email, @passenger.name), subject: 'Flight booking confirmed')
    end
end
