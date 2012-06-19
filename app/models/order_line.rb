class OrderLine < ActiveRecord::Base
  attr_accessible :order_id, :price_pr_unit, :product_sku, :quantity_delivered, :quantity_invoiced, :quantity_ordered
end
