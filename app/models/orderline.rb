class Orderline < ActiveRecord::Base
  attr_accessible :ean, :name, :order_id, :price, :product_id, :qty_ordered, :sku
  belongs_to :order

  validates :order_id, :qty_ordered, presence: true
end