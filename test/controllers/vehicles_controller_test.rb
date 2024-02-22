require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url, as: :json
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference("Vehicle.count") do
      post vehicles_url, params: { vehicle: { alert_cell: @vehicle.alert_cell, alert_email: @vehicle.alert_email, license_plate: @vehicle.license_plate, ownership: @vehicle.ownership, registration_date: @vehicle.registration_date, seat_capacity: @vehicle.seat_capacity, vehicle_name: @vehicle.vehicle_name, vehicle_type_id: @vehicle.vehicle_type_id } }, as: :json
    end

    assert_response :created
  end

  test "should show vehicle" do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { alert_cell: @vehicle.alert_cell, alert_email: @vehicle.alert_email, license_plate: @vehicle.license_plate, ownership: @vehicle.ownership, registration_date: @vehicle.registration_date, seat_capacity: @vehicle.seat_capacity, vehicle_name: @vehicle.vehicle_name, vehicle_type_id: @vehicle.vehicle_type_id } }, as: :json
    assert_response :success
  end

  test "should destroy vehicle" do
    assert_difference("Vehicle.count", -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response :no_content
  end
end
