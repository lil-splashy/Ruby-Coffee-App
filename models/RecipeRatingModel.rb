class Recipe_Rating < ActiveRecord::Base
    belongs_to :recipes
    has_many :ratings, :through => :recipe_ratings
end