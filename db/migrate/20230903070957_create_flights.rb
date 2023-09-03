class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :code
      t.references :departure_airport, null: false, foreign_key: {to_table: :airports}
      t.references :arrival_airport, null: false, foreign_key: {to_table: :airports}
      t.datetime :departure_time
      t.integer :flight_hour

      t.timestamps
    end
  end
end
