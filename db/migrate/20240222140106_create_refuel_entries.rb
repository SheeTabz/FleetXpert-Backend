class CreateRefuelEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :refuel_entries do |t|
      t.string :fuel_amount
      t.integer :odometer_reading_at_refuelling
      t.date :fuel_entry_date
      t.integer :units_taken
      t.string :refuel_place
      t.references :vehicle, null: false, foreign_key: true
      t.references :fuel_type, null: false, foreign_key: true
      t.references :fuel_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
