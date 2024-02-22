require "test_helper"

class FuelStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fuel_station = fuel_stations(:one)
  end

  test "should get index" do
    get fuel_stations_url, as: :json
    assert_response :success
  end

  test "should create fuel_station" do
    assert_difference("FuelStation.count") do
      post fuel_stations_url, params: { fuel_station: { contact_name: @fuel_station.contact_name, contact_phone: @fuel_station.contact_phone, station_code: @fuel_station.station_code, station_name: @fuel_station.station_name } }, as: :json
    end

    assert_response :created
  end

  test "should show fuel_station" do
    get fuel_station_url(@fuel_station), as: :json
    assert_response :success
  end

  test "should update fuel_station" do
    patch fuel_station_url(@fuel_station), params: { fuel_station: { contact_name: @fuel_station.contact_name, contact_phone: @fuel_station.contact_phone, station_code: @fuel_station.station_code, station_name: @fuel_station.station_name } }, as: :json
    assert_response :success
  end

  test "should destroy fuel_station" do
    assert_difference("FuelStation.count", -1) do
      delete fuel_station_url(@fuel_station), as: :json
    end

    assert_response :no_content
  end
end
