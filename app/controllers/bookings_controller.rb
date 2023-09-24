class BookingsController < ApplicationController
  def new
    filt_params = set_params
    flight = Flight.find(filt_params[:id])
    @num_passengers = filt_params[:passenger_count].to_i
    @booking = flight.bookings.build
    @flight_id = flight.id
  end

  def show
    @booking = Booking.includes(:passengers, flight: [:departure_airport, :arrival_airport]).find(params[:id])
    @passengers = @booking.passengers
    @flight = @booking.flight
  end

  def create
    params = booking_params
    flight = Flight.includes(:departure_airport, :arrival_airport).find(params[:flight_id])
    booking = flight.bookings.build(params)
    if booking.save
        booking.passengers.each do |passenger|
          PassengerMailer.with(passenger:).booking_confirmed.deliver_later
        end
        redirect_to booking
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:id,:flight_id, passengers_attributes: [:id,:name, :email])
  end

  def set_params
    params.require(:flight).permit(:id, :passenger_count)
  end
end
