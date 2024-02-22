class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_name
      t.string :license_plate
      t.string :ownership
      t.string :alert_cell
      t.string :alert_email
      t.date :registration_date
      t.integer :seat_capacity
      t.references :vehicle_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
