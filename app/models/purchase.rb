class Purchase < ActiveRecord::Base
  attr_accessible :date, :delivery_number, :invoice_number, :shipping_fee, :state, :supplier_id
  belongs_to :supplier
  has_many :purchaselines, dependent: :destroy

  validates :supplier_id, presence: true

  searchable do
    text :supplier_id, :id, :state
  end
end
