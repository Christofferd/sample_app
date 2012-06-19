class CreateBanklines < ActiveRecord::Migration
  def change
    create_table :banklines do |t|
      t.date :date
      t.string :text
      t.integer :amount
      t.integer :appendex_number
      t.integer :user_id

      t.timestamps
    end
    add_index :banklines, [:user_id, :amount]
  end
end
