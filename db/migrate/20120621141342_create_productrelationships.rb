class CreateProductrelationships < ActiveRecord::Migration
  def change
    create_table :productrelationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :productrelationships, :follower_id
    add_index :productrelationships, :followed_id
    add_index :productrelationships, [:follower_id, :followed_id], unique: true
  end
end