# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :pesel, :string
  end
end
