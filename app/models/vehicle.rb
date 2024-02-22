class Vehicle < ApplicationRecord
  belongs_to :vehicle_type
  has_many :vehicle_trips
  has_many :refuelling_settings
  has_one :vehicle_assignment
end
