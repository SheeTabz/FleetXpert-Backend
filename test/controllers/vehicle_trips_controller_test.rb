require "test_helper"

class VehicleTripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_trip = vehicle_trips(:one)
  end

  test "should get index" do
    get vehicle_trips_url, as: :json
    assert_response :success
  end

  test "should create vehicle_trip" do
    assert_difference("VehicleTrip.count") do
      post vehicle_trips_url, params: { vehicle_trip: { amount_earned: @vehicle_trip.amount_earned, end_time: @vehicle_trip.end_time, no_of_trips: @vehicle_trip.no_of_trips, start_Time: @vehicle_trip.start_Time, trip_date: @vehicle_trip.trip_date, vehicle_id: @vehicle_trip.vehicle_id } }, as: :json
    end

    assert_response :created
  end

  test "should show vehicle_trip" do
    get vehicle_trip_url(@vehicle_trip), as: :json
    assert_response :success
  end

  test "should update vehicle_trip" do
    patch vehicle_trip_url(@vehicle_trip), params: { vehicle_trip: { amount_earned: @vehicle_trip.amount_earned, end_time: @vehicle_trip.end_time, no_of_trips: @vehicle_trip.no_of_trips, start_Time: @vehicle_trip.start_Time, trip_date: @vehicle_trip.trip_date, vehicle_id: @vehicle_trip.vehicle_id } }, as: :json
    assert_response :success
  end

  test "should destroy vehicle_trip" do
    assert_difference("VehicleTrip.count", -1) do
      delete vehicle_trip_url(@vehicle_trip), as: :json
    end

    assert_response :no_content
  end
end
