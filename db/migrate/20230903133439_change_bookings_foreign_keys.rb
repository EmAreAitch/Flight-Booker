class ChangeBookingsForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "bookings", "flights"
    remove_foreign_key "bookings", "passengers"

    add_foreign_key "bookings", "flights", on_delete: :cascade
    add_foreign_key "bookings", "passengers", on_delete: :cascade
  end
end
