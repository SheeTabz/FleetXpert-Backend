class VehicleAssignmentSerializer < ActiveModel::Serializer
  attributes :id, :start_date
  has_one :vehicle
  has_one :driver
  has_one :route
end
