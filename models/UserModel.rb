class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes



	# user.recipes
	has_many :recipes, through => :ratings
end