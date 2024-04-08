class CreateVehicleReportServices < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_report_services do |t|

      t.timestamps
    end
  end
end
