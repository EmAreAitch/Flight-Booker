class BookingsController < ApplicationController
  def new
    filt_params = set_params
    flight = Flight.find(filt_params[:id])
    @num_passengers = filt_params[:passenger_count].to_i
    @booking = flight.bookings.build
    @flight_id = flight.id
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def create
    params = booking_params
    flight = Flight.find(params[:flight_id])
    @flight_id = flight.id
    @booking = flight.bookings.build(params)
    if @booking.save
        redirect_to @booking
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
