class VehicleAssignment < ApplicationRecord
  belongs_to :vehicle
  belongs_to :driver
  belongs_to :route

  validates :vehicle_id, uniqueness: true
  validates :driver_id, uniqueness: true 
end
