class Patient < ApplicationRecord
  has_one :address, as: :addressable
  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits" }

  def surname_and_name
    "#{surname} #{name}"
  end

  def to_s
    surname_and_name
  end
end
