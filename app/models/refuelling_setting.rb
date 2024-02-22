class RefuellingSetting < ApplicationRecord
  belongs_to :vehicle
  belongs_to :fuel_type
  belongs_to :fuel_station
end
