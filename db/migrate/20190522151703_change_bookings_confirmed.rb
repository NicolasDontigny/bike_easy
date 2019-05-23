class ChangeBookingsConfirmed < ActiveRecord::Migration[5.2]
    def change
    change_column :bookings, :confirmed, :string, default: "pending"
  end
end
