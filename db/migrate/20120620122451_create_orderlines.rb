class CreateOrderlines < ActiveRecord::Migration
  def change
    create_table :orderlines do |t|
      t.string :sku
      t.string :name
      t.string :ean
      t.integer :qty_ordered
      t.integer :qty_delivered, :default => "0"
      t.integer :qty_invoiced, :default => "0"
      t.integer :price
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
