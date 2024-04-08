class AddUserIdToFuelStations < ActiveRecord::Migration[7.0]
  def change
    add_reference :fuel_stations, :user, foreign_key: true
  end
end
