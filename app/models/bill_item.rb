# frozen_string_literal: true

class BillItem < ApplicationRecord
  has_and_belongs_to_many :bill

  def position
    "#{name} - #{price}"
  end
end
