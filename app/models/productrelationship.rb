class Productrelationship < ActiveRecord::Base
  attr_accessible :followed_id

  belongs_to :follower, class_name: "Product"
  belongs_to :followed, class_name: "Supplierproduct"

	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
