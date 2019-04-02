class CreateJoinTableBillBillItem < ActiveRecord::Migration[5.2]
  def change
    create_join_table :bills, :bill_items do |t|
      t.index [:bill_id, :bill_item_id]
      # t.index [:bill_item_id, :bill_id]
    end
  end
end
