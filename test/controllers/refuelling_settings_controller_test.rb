require "test_helper"

class RefuellingSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @refuelling_setting = refuelling_settings(:one)
  end

  test "should get index" do
    get refuelling_settings_url, as: :json
    assert_response :success
  end

  test "should create refuelling_setting" do
    assert_difference("RefuellingSetting.count") do
      post refuelling_settings_url, params: { refuelling_setting: { fuel_amount: @refuelling_setting.fuel_amount, fuel_entry_date: @refuelling_setting.fuel_entry_date, fuel_station_id: @refuelling_setting.fuel_station_id, fuel_type_id: @refuelling_setting.fuel_type_id, odometer_reading_at_refuelling: @refuelling_setting.odometer_reading_at_refuelling, refuel_place: @refuelling_setting.refuel_place, units_taken: @refuelling_setting.units_taken, vehicle_id: @refuelling_setting.vehicle_id } }, as: :json
    end

    assert_response :created
  end

  test "should show refuelling_setting" do
    get refuelling_setting_url(@refuelling_setting), as: :json
    assert_response :success
  end

  test "should update refuelling_setting" do
    patch refuelling_setting_url(@refuelling_setting), params: { refuelling_setting: { fuel_amount: @refuelling_setting.fuel_amount, fuel_entry_date: @refuelling_setting.fuel_entry_date, fuel_station_id: @refuelling_setting.fuel_station_id, fuel_type_id: @refuelling_setting.fuel_type_id, odometer_reading_at_refuelling: @refuelling_setting.odometer_reading_at_refuelling, refuel_place: @refuelling_setting.refuel_place, units_taken: @refuelling_setting.units_taken, vehicle_id: @refuelling_setting.vehicle_id } }, as: :json
    assert_response :success
  end

  test "should destroy refuelling_setting" do
    assert_difference("RefuellingSetting.count", -1) do
      delete refuelling_setting_url(@refuelling_setting), as: :json
    end

    assert_response :no_content
  end
end
