class ModifyForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "passengers", "bookings", on_delete: :cascade
  end
end
