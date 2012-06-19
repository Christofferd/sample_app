class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :name
      t.integer :stock
      t.integer :price
      t.integer :ean

      t.timestamps
    end
    add_index :products, [:sku, :name, :ean]
  end
end
