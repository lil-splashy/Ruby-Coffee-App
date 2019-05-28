class User < ActiveRecord::Base
	has_secure_password
	has_many :recipes
	has_many :recipe_ratings, through => :recipes
end