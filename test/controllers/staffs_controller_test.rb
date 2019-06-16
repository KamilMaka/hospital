require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_url
    assert_response :redirect
  end

  test "should create staff" do
    assert_difference('Staff.count') do
      post staffs_url, params: { staff: { name: @staff.name, occupation: @staff.occupation, pesel: @staff.pesel, surname: @staff.surname } }
    end

    assert_redirected_to staff_url(Staff.last)
  end

  test "shouldnt show staff if not login in" do
    get staff_url(@staff)
    assert_redirected_to new_user_session_url
  end

  test "shouldnt get edit if not login in" do
    get edit_staff_url(@staff)
    assert_redirected_to new_user_session_url
  end

  test "shouldnt update staff when not login in" do
    patch staff_url(@staff), params: { staff: { name: @staff.name, occupation: @staff.occupation, pesel: @staff.pesel, surname: @staff.surname } }
    assert_redirected_to new_user_session_url
  end

  test "should destroy staff" do
    assert_difference('Staff.count', -1) do
      delete staff_url(@staff)
    end

    assert_redirected_to staffs_url
  end
end
