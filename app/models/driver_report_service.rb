class DriverReportService < ApplicationRecord
    def self.driver_report(user_id)
        Driver.joins(:vehicle_assignment)
              .joins('LEFT JOIN vehicles ON vehicle_assignments.vehicle_id = vehicles.id')
              .where(user_id: user_id)
              .select('drivers.driver_name, vehicles.vehicle_name AS assigned_vehicle, drivers.joining_date, drivers.mobile')
     end
end
