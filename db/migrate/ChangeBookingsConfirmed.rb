class ChangeBookingsConfirmed < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :bookings do |t|
        dir.up   { t.change :confirmed, :boolean }
        dir.down { t.change :confirmed, :string, :default "pending" }
      end
    end
  end
end
