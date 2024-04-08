class VehicleReportService < ApplicationRecord
    def self.daily_report(vehicle_id)
        # Calculate daily revenue
        vehicle_name = Vehicle.find(vehicle_id).vehicle_name
        revenue = VehicleTrip.where(vehicle_id: vehicle_id)
                              .select("DATE(trip_date) AS date, SUM(amount_earned::numeric) AS amount, SUM(no_of_trips) AS total_trips")
                              .group("DATE(trip_date)")
                              .order("DATE(trip_date)")
    
        # Calculate daily fuel expenses
        expenses = RefuelEntry.joins(:vehicle)
                              .where(vehicles: { id: vehicle_id })
                              .select("DATE(fuel_entry_date) AS date, SUM((fuel_amount::numeric)::numeric) AS amount")
                              .group("DATE(fuel_entry_date)")
                              .order("DATE(fuel_entry_date)")
    
        # Calculate daily profit
        profit = revenue.map do |record|
          expense_record = expenses.find { |expense| expense.date == record.date }
          [record.date, record.amount - (expense_record&.amount || 0)]
        end.to_h

        # Prepare the final report data
    revenue = revenue.map do |record|
        { date: record.date, amount: record.amount, total_trips: record.total_trips }
      end
    
        { vehicle_name: vehicle_name, revenue: revenue, expenses: expenses, profit: profit }
     end
end
