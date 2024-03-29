class User < ActiveRecord::Base 
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	has_many :microposts, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followers, through: :reverse_relationships, source: :follower
	has_many :products, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :orderlines, :through => :orders
	has_many :suppliers, dependent: :destroy
	has_many :supplierproducts, :through => :suppliers
	has_many :purchases, :through => :suppliers

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
#	validates :password, length: { minimum: 6 } # outcommented until I have figured out why it disrupts the send_password_reset
#	validates :password_confirmation, presence: true # outcommented until I have figured out why it disrupts the send_password_reset

	def feed
		Micropost.from_users_followed_by(self)
	end

	def following?(other_user)
		relationships.find_by_followed_id(other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by_followed_id(other_user.id).destroy
	end

	def send_password_reset
		self.password_reset_token = SecureRandom.urlsafe_base64
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	private
		
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end