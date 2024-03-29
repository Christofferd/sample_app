class Order < ActiveRecord::Base
  attr_accessible :address, :address2, :city, :country, :date, :mail, :name, :number, :payment, :phone, :zip_code
  belongs_to :user
  has_many :orderlines, dependent: :destroy

  validates :user_id, :number, presence: true

  searchable do
    text :address, :address2, :city, :date, :mail, :name, :number, :phone, :zip_code
  end
end