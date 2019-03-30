class Staff < ApplicationRecord
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :nurse_appointments, class_name: 'Appointment', foreign_key: 'nurse_id'
  has_one :address, as: :addressable
  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits" }
  validates :occupation, inclusion: { in: %w(doctor nurse),
                                      message: "should be doctor or nurse" }

  enum occupation: {doctor: 0, nurse: 1 }

  scope :doctor, -> { where( occupation: 'doctor') }
  scope :nurses, -> { where( occupation: 'nurse') }

  def surname_and_name
    "#{surname} #{name}"
  end

  def to_s
    surname_and_name
  end
end
