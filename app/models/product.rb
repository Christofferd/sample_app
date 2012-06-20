class Product < ActiveRecord::Base
  attr_accessible :ean, :name, :price, :stock, :user_id, :sku
  belongs_to :user

  validates :user_id, presence: true

  searchable do
    text :ean, :sku, :name
  end
end
