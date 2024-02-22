require "test_helper"

class RefuelEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refuel_entry = refuel_entries(:one)
  end

  test "should get index" do
    get refuel_entries_url, as: :json
    assert_response :success
  end

  test "should create refuel_entry" do
    assert_difference("RefuelEntry.count") do
      post refuel_entries_url, params: { refuel_entry: { fuel_amount: @refuel_entry.fuel_amount, fuel_entry_date: @refuel_entry.fuel_entry_date, fuel_station_id: @refuel_entry.fuel_station_id, fuel_type_id: @refuel_entry.fuel_type_id, odometer_reading_at_refuelling: @refuel_entry.odometer_reading_at_refuelling, refuel_place: @refuel_entry.refuel_place, units_taken: @refuel_entry.units_taken, vehicle_id: @refuel_entry.vehicle_id } }, as: :json
    end

    assert_response :created
  end

  test "should show refuel_entry" do
    get refuel_entry_url(@refuel_entry), as: :json
    assert_response :success
  end

  test "should update refuel_entry" do
    patch refuel_entry_url(@refuel_entry), params: { refuel_entry: { fuel_amount: @refuel_entry.fuel_amount, fuel_entry_date: @refuel_entry.fuel_entry_date, fuel_station_id: @refuel_entry.fuel_station_id, fuel_type_id: @refuel_entry.fuel_type_id, odometer_reading_at_refuelling: @refuel_entry.odometer_reading_at_refuelling, refuel_place: @refuel_entry.refuel_place, units_taken: @refuel_entry.units_taken, vehicle_id: @refuel_entry.vehicle_id } }, as: :json
    assert_response :success
  end

  test "should destroy refuel_entry" do
    assert_difference("RefuelEntry.count", -1) do
      delete refuel_entry_url(@refuel_entry), as: :json
    end

    assert_response :no_content
  end
end
