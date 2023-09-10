# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
Airport.delete_all
Flight.delete_all
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = 0 WHERE name = 'airports'")
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = 0 WHERE name = 'flights'")

# Create random airports
airports = [
  { name: "Airport A", code: "AAA", location: "City A" },
  { name: "Airport B", code: "BBB", location: "City B" },
  { name: "Airport C", code: "CCC", location: "City C" },
  { name: "Airport D", code: "DDD", location: "City D" },
  { name: "Airport E", code: "EEE", location: "City E" },
  { name: "Airport F", code: "FFF", location: "City F" },
  { name: "Airport G", code: "GGG", location: "City G" },
  { name: "Airport H", code: "HHH", location: "City H" },
  { name: "Airport I", code: "III", location: "City I" },
  { name: "Airport J", code: "JJJ", location: "City J" }
# Add more airports as needed
]

airports.each do |airport|
  Airport.create(airport)
end

# Create random flights
flights = [
  { code: "FL001", departure_airport_id: 1, arrival_airport_id: 3, departure_time: DateTime.now, flight_hour: 8 },
  { code: "FL002", departure_airport_id: 2, arrival_airport_id: 4, departure_time: DateTime.tomorrow, flight_hour: 9 },
  { code: "FL003", departure_airport_id: 3, arrival_airport_id: 5, departure_time: DateTime.now + 2.days, flight_hour: 8 },
  { code: "FL004", departure_airport_id: 1, arrival_airport_id: 2, departure_time: DateTime.now + 3.day, flight_hour: 6 },
  { code: "FL005", departure_airport_id: 1, arrival_airport_id: 3, departure_time: DateTime.now, flight_hour: 5 },
  { code: "FL006", departure_airport_id: 1, arrival_airport_id: 3, departure_time: DateTime.now, flight_hour: 3 },
  { code: "FL007", departure_airport_id: 4, arrival_airport_id: 2, departure_time: DateTime.now + 2.days, flight_hour: 2 },
  { code: "FL008", departure_airport_id: 2, arrival_airport_id: 1, departure_time: DateTime.now + 4.days, flight_hour: 4 },
  { code: "FL009", departure_airport_id: 7, arrival_airport_id: 9, departure_time: DateTime.now + 3.days, flight_hour: 7 },
  { code: "FL010", departure_airport_id: 1, arrival_airport_id: 3, departure_time: DateTime.now, flight_hour: 7 },
  { code: "FL011", departure_airport_id: 10, arrival_airport_id: 5, departure_time: DateTime.now, flight_hour: 9 },
  { code: "FL012", departure_airport_id: 3, arrival_airport_id: 7, departure_time: DateTime.now, flight_hour: 10 },
  { code: "FL013", departure_airport_id: 5, arrival_airport_id: 8, departure_time: DateTime.tomorrow, flight_hour: 4 },
  { code: "FL014", departure_airport_id: 10, arrival_airport_id: 6, departure_time: DateTime.now, flight_hour: 5 },
  { code: "FL015", departure_airport_id: 9, arrival_airport_id: 7, departure_time: DateTime.now, flight_hour: 6 },
  { code: "FL016", departure_airport_id: 9, arrival_airport_id: 2, departure_time: DateTime.now, flight_hour: 7 },
  { code: "FL017", departure_airport_id: 6, arrival_airport_id: 4, departure_time: DateTime.now, flight_hour: 4 },
  { code: "FL018", departure_airport_id: 4, arrival_airport_id: 8, departure_time: DateTime.now, flight_hour: 6 },
  { code: "FL019", departure_airport_id: 7, arrival_airport_id: 10, departure_time: DateTime.now, flight_hour: 6 },
  { code: "FL020", departure_airport_id: 8, arrival_airport_id: 10, departure_time: DateTime.now + 2.days, flight_hour: 5 },
# Add more flights as needed
]

flights.each do |flight|
  Flight.create(flight)
end
