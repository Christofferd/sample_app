class Purchaseline < ActiveRecord::Base
  attr_accessible :ean, :name, :price, :purchase_id, :qty_purchased, :qty_received, :sku
  belongs_to :purchase

  validates :purchase_id, :qty_purchased, presence: true
end
