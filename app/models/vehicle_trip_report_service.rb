class VehicleTripReportService < ApplicationRecord
    def self.generate_report(vehicle_id)
        VehicleTrip.joins(:vehicle)
        .group(:vehicle_id, :trip_date)
        .select('MIN(vehicles.vehicle_name) as vehicle_name, trip_date, SUM(no_of_trips) as total_trips, SUM(amount_earned::numeric) as total_earned')
end
end
