class Supplier < ActiveRecord::Base
  attr_accessible :address, :address2, :city, :country, :currency, :mail, :name, :zip_code
  belongs_to :user

  validates :user_id, presence: true

  searchable do
    text :name
  end  	
end
