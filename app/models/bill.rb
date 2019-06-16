# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :appointment
  has_and_belongs_to_many :bill_items
  before_destroy { bill_items.clear }

  before_save :set_paid_date

  def set_paid_date
    self.paid_date = DateTime.now if is_paid_changed? && is_paid == true
  end
end
