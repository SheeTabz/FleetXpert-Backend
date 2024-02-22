require "test_helper"

class VehicleAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_assignment = vehicle_assignments(:one)
  end

  test "should get index" do
    get vehicle_assignments_url, as: :json
    assert_response :success
  end

  test "should create vehicle_assignment" do
    assert_difference("VehicleAssignment.count") do
      post vehicle_assignments_url, params: { vehicle_assignment: { driver_id: @vehicle_assignment.driver_id, route_id: @vehicle_assignment.route_id, start_date: @vehicle_assignment.start_date, vehicle_id: @vehicle_assignment.vehicle_id } }, as: :json
    end

    assert_response :created
  end

  test "should show vehicle_assignment" do
    get vehicle_assignment_url(@vehicle_assignment), as: :json
    assert_response :success
  end

  test "should update vehicle_assignment" do
    patch vehicle_assignment_url(@vehicle_assignment), params: { vehicle_assignment: { driver_id: @vehicle_assignment.driver_id, route_id: @vehicle_assignment.route_id, start_date: @vehicle_assignment.start_date, vehicle_id: @vehicle_assignment.vehicle_id } }, as: :json
    assert_response :success
  end

  test "should destroy vehicle_assignment" do
    assert_difference("VehicleAssignment.count", -1) do
      delete vehicle_assignment_url(@vehicle_assignment), as: :json
    end

    assert_response :no_content
  end
end
