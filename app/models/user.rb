class User < ActiveRecord::Base
	has_secure_password
	
	validates_presence_of :first_name, :last_name, :email
	validates_uniqueness_of :email
	
	has_many :articles
	
	attr_accessor :full_name
	
	def full_name
		first_name + " " + last_name
	end

end
