class CreateVehicleTripReportServices < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_trip_report_services do |t|

      t.timestamps
    end
  end
end
