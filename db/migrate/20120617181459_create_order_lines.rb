class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.string :product_sku
      t.integer :quantity_ordered
      t.integer :quantity_delivered
      t.integer :quantity_invoiced
      t.integer :price_pr_unit
      t.integer :order_id

      t.timestamps
    end
  end
end
