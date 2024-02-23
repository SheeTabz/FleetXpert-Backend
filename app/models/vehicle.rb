class Vehicle < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :user
  has_many :vehicle_trips
  has_many :refuel_entries
  has_one :vehicle_assignment
end
