class Vehicle < ApplicationRecord
  belongs_to :vehicle_type
  has_many :vehicle_trips
  has_many :refuel_entries
  has_one :vehicle_assignment
end
