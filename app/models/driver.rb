class Driver < ApplicationRecord
    has_one :vehicle_assignment
    # has_one :vehicle, through: :vehicle_assignment
    belongs_to :user

    validates :email, presence: true, uniqueness: true
    # has_one_attached :image
end

