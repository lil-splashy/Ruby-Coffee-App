require 'sinatra/base'



require './controllers/ApplicationController'
require './controllers/RecipeController'
require './controllers/UserController'


require './models/RatingModel'
require './models/RecipeModel'
require './models/UserModel'

map ('/') {
  run ApplicationController
}

map ('/recipes') {
  run RecipeController
}

map ('/users') {
	run UserController
}