class Driver < ApplicationRecord
    has_one :vehicle_assignment
    belongs_to :user
end
