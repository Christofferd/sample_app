class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.string :state, :default => "open"
      t.string :delivery_number
      t.string :invoice_number
      t.integer :shipping_fee
      t.datetime :date

      t.timestamps
    end
  end
end
