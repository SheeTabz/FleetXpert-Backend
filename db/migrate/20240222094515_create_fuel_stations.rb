class CreateFuelStations < ActiveRecord::Migration[7.0]
  def change
    create_table :fuel_stations do |t|
      t.string :station_name
      t.string :station_code
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
