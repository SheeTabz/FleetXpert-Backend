class VehicleTripSerializer < ActiveModel::Serializer
  attributes :id, :no_of_trips, :start_Time, :end_time, :trip_date, :amount_earned
  has_one :vehicle
end
