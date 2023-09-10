class ChangeForeignKeysInAirport < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "flights", "airports", column: "arrival_airport_id"
    remove_foreign_key "flights", "airports", column: "departure_airport_id"

    add_foreign_key "flights", "airports", column: "arrival_airport_id", on_delete: :cascade
    add_foreign_key "flights", "airports", column: "departure_airport_id", on_delete: :cascade
  end
end
