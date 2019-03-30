class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'Staff'
  belongs_to :nurse, class_name: 'Staff', optional: true
  belongs_to :reservation
  scope :nurses, -> { where( occupation: 'nurse') }
  scope :doctor, -> { where( occupation: 'doctor') }
end
