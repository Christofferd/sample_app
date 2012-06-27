class Supplierproduct < ActiveRecord::Base
  attr_accessible :ean, :name, :price, :sku, :stock, :supplier_id
  belongs_to :supplier
  has_many :reverse_productrelationships, foreign_key: "followed_id", class_name: "Productrelationship", dependent: :destroy
  has_many :followers, through: :reverse_productrelationships, source: :follower

  validates :supplier_id, presence: true

  searchable do
    text :ean, :name, :sku
    string :supplier_id
  end
end