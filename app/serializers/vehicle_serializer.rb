class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_name, :license_plate, :ownership, :alert_cell, :alert_email, :registration_date, :seat_capacity
  has_one :vehicle_type
  has_many :vehicle_trips
  has_many :refuel_entries 
  has_one :vehicle_assignment, serializer: VehicleAssignmentSerializer
  belongs_to :user
end
