# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "Staff"
  belongs_to :nurse, class_name: "Staff", optional: true
  belongs_to :reservation
  has_one :bill, dependent: :destroy
  scope :nurses, -> { where(occupation: "nurse") }
  scope :doctor, -> { where(occupation: "doctor") }

  def to_s
    "#{reservation.patient.surname_and_name} - #{doctor.surname_and_name}"
  end
end
