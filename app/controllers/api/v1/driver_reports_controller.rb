class Api::V1::DriverReportsController < ApplicationController
  
    def index
        @drivers = Driver.includes(:vehicle_assignment, :user)
                        .select('drivers.id, drivers.driver_name, drivers.joining_date, drivers.mobile, vehicles.vehicle_name')
                        .joins('LEFT JOIN vehicle_assignments ON drivers.id = vehicle_assignments.driver_id')
                        .joins('LEFT JOIN vehicles ON vehicle_assignments.vehicle_id = vehicles.id')
      end
end
