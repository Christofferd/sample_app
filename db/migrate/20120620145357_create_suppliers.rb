class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :currency
      t.string :mail
      t.integer :user_id

      t.timestamps
    end
  end
end
