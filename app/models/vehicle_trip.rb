class VehicleTrip < ApplicationRecord
  belongs_to :vehicle
  validates :vehicle, presence: true

end
