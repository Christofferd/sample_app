class RemoveUserIdFromSupplierproducts < ActiveRecord::Migration
  def up
  	remove_column :supplierproducts, :user_id
  end

  def down
  end
end
