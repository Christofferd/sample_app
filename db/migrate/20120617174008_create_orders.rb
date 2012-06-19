class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.datetime :date
      t.string :state, :default => "open"
      t.string :payment
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :address2
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :mail
      t.string :phone

      t.timestamps
    end
  end
end
