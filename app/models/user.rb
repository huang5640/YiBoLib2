class User < ActiveRecord::Base
	has_many :books
	has_many :checkings
	has_one :manager

    has_secure_password
    serialize :auth_locations, Array
  
	EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
	validates :YiBoID, presence: true, uniqueness: true
	validates_format_of :email, :with => EMAIL_REGEX
	#validates :password, length: { in: 6..20 }

	def User.digest(string)
	  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	  BCrypt::Password.create(string, cost: cost)
	end
end
