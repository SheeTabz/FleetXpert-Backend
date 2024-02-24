class Driver < ApplicationRecord
    has_one :vehicle_assignment
    belongs_to :user
    has_one_attached :image
end

