class VehicleAssignment < ApplicationRecord
  belongs_to :vehicle
  belongs_to :driver
  belongs_to :route
end
