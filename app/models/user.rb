class User < ActiveRecord::Base
   attr_accessor :YiBoID

	has_many :books
   has_secure_password
  
	EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
	validates :YiBoID, presence: true, uniqueness: true
	validates_format_of :email, :with => EMAIL_REGEX
	#validates :password, length: { in: 6..20 }
end
