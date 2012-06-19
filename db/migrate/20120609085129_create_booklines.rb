class CreateBooklines < ActiveRecord::Migration
  def change
    create_table :booklines do |t|
      t.date :date
      t.string :text
      t.integer :amount
      t.integer :appendix_number
      t.integer :user_id

      t.timestamps
    end
    add_index :booklines, [:user_id, :amount]
  end
end
