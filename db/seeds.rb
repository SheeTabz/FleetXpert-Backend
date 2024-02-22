# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
vehicle_type = VehicleType.create(vehicle_type_name: "Bus")
vehicle_type = VehicleType.create(vehicle_type_name: "Matatu")
vehicle_type = VehicleType.create(vehicle_type_name: "Manyanga")
vehicle_type = VehicleType.create(vehicle_type_name: "Mini Bus")

route = Route.create(to: "Buru", from: "Town")