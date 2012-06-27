class CreatePurchaselines < ActiveRecord::Migration
  def change
    create_table :purchaselines do |t|
      t.string :sku
      t.string :name
      t.string :ean
      t.integer :qty_purchased
      t.integer :qty_received
      t.integer :price
      t.integer :purchase_id

      t.timestamps
    end
  end
end
