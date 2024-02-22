class CreateVehicleTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_trips do |t|
      t.integer :no_of_trips
      t.time :start_Time
      t.time :end_time
      t.date :trip_date
      t.string :amount_earned
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
