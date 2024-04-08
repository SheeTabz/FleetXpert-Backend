class RefuelEntrySerializer < ActiveModel::Serializer
  attributes :id, :fuel_amount, :odometer_reading_at_refuelling, :fuel_entry_date, :units_taken, :refuel_place, :fuel_type_id, :fuel_station_id
  has_one :vehicle
  has_one :fuel_type
  has_one :fuel_station
end
