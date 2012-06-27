class CreateSupplierproducts < ActiveRecord::Migration
  def change
    create_table :supplierproducts do |t|
      t.string :sku
      t.string :name
      t.integer :stock
      t.integer :price
      t.integer :ean
      t.integer :user_id
      t.integer :supplier_id

      t.timestamps
    end
    add_index :supplierproducts, [:sku, :name, :ean]
  end
end
