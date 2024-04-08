class CreateDriverReportServices < ActiveRecord::Migration[7.0]
  def change
    create_table :driver_report_services do |t|

      t.timestamps
    end
  end
end
