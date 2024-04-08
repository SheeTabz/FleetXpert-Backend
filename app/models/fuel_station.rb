class FuelStation < ApplicationRecord
    has_many :refuel_entries
    belongs_to :user
end
