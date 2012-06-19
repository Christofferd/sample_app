class Product < ActiveRecord::Base
  attr_accessible :ean, :name, :price, :stock, :user_id, :sku
  belongs_to :user

  validates :user_id, presence: true

	def self.search(search)
		if search
		  where('name LIKE ?', "%#{search}%")
		else
		  scoped
		end
	end
end
