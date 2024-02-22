class RefuellingSettingSerializer < ActiveModel::Serializer
  attributes :id, :fuel_amount, :odometer_reading_at_refuelling, :fuel_entry_date, :units_taken, :refuel_place
  has_one :vehicle
  has_one :fuel_type
  has_one :fuel_station
end
