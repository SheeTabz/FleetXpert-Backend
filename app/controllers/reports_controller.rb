class ReportsController < ApplicationController
    def vehicle_report
        user_id = params[:user_id]
 @vehicles = Vehicle.joins("LEFT JOIN vehicle_assignments ON vehicles.id = vehicle_assignments.vehicle_id")
                       .joins("LEFT JOIN drivers ON vehicle_assignments.driver_id = drivers.id")
                       .joins("LEFT JOIN vehicle_trips ON vehicles.id = vehicle_trips.vehicle_id")
                       .where(vehicles: { user_id: user_id })
                       .select("vehicles.vehicle_name, vehicles.license_plate, drivers.driver_name AS assigned_driver, vehicle_assignments.start_date AS joining_date, SUM(vehicle_trips.amount_earned::DECIMAL) AS total_revenue")
                       .group("vehicles.id, drivers.id, vehicle_assignments.id")

 render json: @vehicles.map { |v| { vehicle: v.vehicle_name, license_plate: v.license_plate, assigned_driver: v.assigned_driver || "No driver", joining_date: v.joining_date, total_revenue: v.total_revenue || 0 } }
     end

     # app/controllers/drivers_controller.rb

def driver_report
    user_id = params[:user_id]
 @drivers = Driver.joins("LEFT JOIN vehicle_assignments ON drivers.id = vehicle_assignments.driver_id")
                    .joins("LEFT JOIN vehicles ON vehicle_assignments.vehicle_id = vehicles.id")
                    .joins("LEFT JOIN vehicle_trips ON vehicles.id = vehicle_trips.vehicle_id")
                    .where(drivers: { user_id: user_id })
                    .select("drivers.*, vehicles.vehicle_name, vehicles.license_plate, vehicle_assignments.start_date AS joining_date, COUNT(vehicle_trips.id) AS total_trips, SUM(vehicle_trips.amount_earned::DECIMAL) AS total_revenue")
                    .group("drivers.id, vehicles.id, vehicle_assignments.start_date")

 render json: @drivers.map do |d|
   {
     driver_name: d.driver_name,
     phone_number: d.mobile,
     joining_date: d.joining_date,
     vehicle_assigned: d.vehicle_name || "Not assigned",
     license_plate: d.license_plate || "N/A",
     total_trips: d.total_trips || 0,
     total_revenue: d.total_revenue || 0
   }
 end
   end

   def total_summary
    user_id = params[:user_id]

    # Total vehicles
    total_vehicles = Vehicle.where(user_id: user_id).count

    # Total drivers
    total_drivers = Driver.where(user_id: user_id).count

    # Total revenue from all trips
    total_revenue = VehicleTrip.joins(:vehicle)
                                .where(vehicles: { user_id: user_id })
                                .sum("amount_earned::numeric")

    # Prepare the report
    report = {
      total_vehicles: total_vehicles,
      total_drivers: total_drivers,
      total_revenue: total_revenue
    }

    render json: report
 end
 def top_vehicles
    # Assuming you have a Vehicle model and a VehicleTrip model
    # where VehicleTrip has a `vehicle_id` and `amount_earned`
    user_id = params[:user_id]
    # Ensure that `amount_earned` is a numeric type to avoid summing errors
    @top_vehicles_report = Vehicle.connection.select_all(<<-SQL
    WITH total_earnings AS (
      SELECT SUM(CAST(vehicle_trips.amount_earned AS DECIMAL)) AS total_earnings
      FROM vehicle_trips
      INNER JOIN vehicles ON vehicles.id = vehicle_trips.vehicle_id
      WHERE vehicles.user_id = #{user_id}
    )
    SELECT vehicles.vehicle_name, 
           SUM(CAST(vehicle_trips.amount_earned AS DECIMAL)) AS total_revenue, 
           COUNT(vehicle_trips.id) AS total_trips, 
           (SUM(CAST(vehicle_trips.amount_earned AS DECIMAL)) / (SELECT total_earnings FROM total_earnings)) * 100 AS percentage
    FROM vehicles
    INNER JOIN vehicle_trips ON vehicles.id = vehicle_trips.vehicle_id
    WHERE vehicles.user_id = #{user_id}
    GROUP BY vehicles.id
    ORDER BY total_revenue DESC, total_trips DESC
    LIMIT 5
 SQL
 ).to_a

 render json: @top_vehicles_report


   end
   

   
end
