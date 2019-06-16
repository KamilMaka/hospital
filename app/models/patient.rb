# frozen_string_literal: true

class Patient < ApplicationRecord
  before_destroy do
    add_errors_if_unpaid
    throw(:abort) if errors.present?
  end
  # https://medium.com/appaloosa-store-engineering/caution-when-using-before-destroy-with-model-association-71600b8bfed2
  # uwaga na before_destroy (opis w linku wyżej)

  has_one :address, as: :addressable, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :avatar
  accepts_nested_attributes_for :address

  validates_presence_of :name, :surname, :pesel
  validates :pesel, format: { with: /\d{11}/,
                              message: "should contain 11 digits" }

  def surname_and_name
    "#{surname} #{name}"
  end

  def to_s
    surname_and_name
  end

  def self.search(search)
    if search
      patient = Patient.find_by(surname: search)
      if patient
        where(id: patient)
      else
        Patient.all
      end
    else
      Patient.all
    end
  end

  private
    def add_errors_if_unpaid
      errors.add(:base, "Cannot delete patient with unpaid bills") if any_unpaid_bill_exists?
    end

    def any_unpaid_bill_exists?
      reservations.joins(:bill).where("bills.is_paid = false").exists?
    end
end
