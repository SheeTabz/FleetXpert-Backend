class User < ApplicationRecord
    has_many :drivers
    has_many :vehicles
    has_secure_password
   

end
