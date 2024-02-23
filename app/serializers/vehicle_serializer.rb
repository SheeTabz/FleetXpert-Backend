class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_name, :license_plate, :ownership, :alert_cell, :alert_email, :registration_date, :seat_capacity
  has_one :vehicle_type
  belongs_to :user
end
