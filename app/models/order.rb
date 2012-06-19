class Order < ActiveRecord::Base
  attr_accessible :address, :address2, :city, :country, :date, :mail, :name, :number, :payment, :phone, :state, :user_id, :zip_code
  belongs_to :user
  has_many :order_lines

  validates :user_id, presence: true

	def self.search(search)
		if search
		  where('number LIKE ?', "%#{search}%")
		else
		  scoped
		end
	end
end