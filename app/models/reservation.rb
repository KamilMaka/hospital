# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :patient
  has_one :appointment, dependent: :destroy
  has_one :bill, through: :appointment

  validates_presence_of :reservation_time
  validate :reservation_time_cannot_be_in_the_past

  def reservation_time_cannot_be_in_the_past
    if reservation_time.present? && reservation_time < DateTime.now
      errors.add(:reservation_time, "can't be in the past")
    end
  end

  def display_data
    "#{reservation_time} - #{patient.surname_and_name}"
  end

  def to_s
    display_data
  end
end
