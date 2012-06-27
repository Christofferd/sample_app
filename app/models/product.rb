class Product < ActiveRecord::Base
  attr_accessible :ean, :name, :price, :stock, :sku
  belongs_to :user
  has_many :productrelationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_supplierproducts, through: :productrelationships, source: :followed

  validates :user_id, :sku, :name, presence: true

  searchable do
    text :ean, :sku, :name
  end

  def follow!(supplierproduct)
    productrelationships.create!(followed_id: supplierproduct.id)
  end

	def following?(supplierproduct)
  	productrelationships.find_by_followed_id(supplierproduct.id)
	end

	def unfollow!(supplierproduct)
		productrelationships.find_by_followed_id(supplierproduct.id).destroy
	end
end