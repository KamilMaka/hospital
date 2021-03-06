# frozen_string_literal: true

require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "shouldnt get new when not login in" do
    get new_patient_url
    assert_redirected_to new_user_session_url
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: { patient: { name: @patient.name, pesel: @patient.pesel, surname: @patient.surname } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "shouldnt show patient when not login in" do
    get patient_url(@patient)
    assert_redirected_to new_user_session_url
  end

  test "shouldnt get edit if not login in" do
    get edit_patient_url(@patient)
    assert_redirected_to new_user_session_url
  end

  test "shouldnt update patient when not login in" do
    patch patient_url(@patient), params: { patient: { name: @patient.name, pesel: @patient.pesel, surname: @patient.surname } }
    assert_redirected_to new_user_session_url
  end

  test "should destroy patient" do
    assert_difference("Patient.count", -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
