class FlightsController < ApplicationController
  def index
    if params[:search].present?
      @search = search_param()
      if (1..4).include?(@search[:passenger_count].to_i)
        @flight = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND DATE(departure_time) = ?", @search[:departure], @search[:arrival], @search[:departure_date])
        @number_of_flights = @flight.size
      else
        flash.now[:alert] = "Number of passengers must be between 1 and 4"
      end
    end
    @airports = Airport.all.map { |airport| ["#{airport.name} - #{airport.location}", airport.id] }
    @dates = Flight.pluck(:departure_time).map(&:to_date).uniq
  end

  private

  def search_param
    params.require(:search).permit(:departure, :arrival, :passenger_count, :departure_date)
  end
end
