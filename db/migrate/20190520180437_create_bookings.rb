class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :confirmed, default: false
      t.references :user
      t.references :bike

      t.timestamps
    end
  end
end
