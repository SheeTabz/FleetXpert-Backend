require "test_helper"

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get drivers_url, as: :json
    assert_response :success
  end

  test "should create driver" do
    assert_difference("Driver.count") do
      post drivers_url, params: { driver: { address: @driver.address, date_of_birth: @driver.date_of_birth, driver-name: @driver.driver-name, email: @driver.email, joining_date: @driver.joining_date, license_issue_date: @driver.license_issue_date, license_no: @driver.license_no, license_type: @driver.license_type, mobile: @driver.mobile, national_id: @driver.national_id } }, as: :json
    end

    assert_response :created
  end

  test "should show driver" do
    get driver_url(@driver), as: :json
    assert_response :success
  end

  test "should update driver" do
    patch driver_url(@driver), params: { driver: { address: @driver.address, date_of_birth: @driver.date_of_birth, driver-name: @driver.driver-name, email: @driver.email, joining_date: @driver.joining_date, license_issue_date: @driver.license_issue_date, license_no: @driver.license_no, license_type: @driver.license_type, mobile: @driver.mobile, national_id: @driver.national_id } }, as: :json
    assert_response :success
  end

  test "should destroy driver" do
    assert_difference("Driver.count", -1) do
      delete driver_url(@driver), as: :json
    end

    assert_response :no_content
  end
end
