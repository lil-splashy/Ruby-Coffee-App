require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/RecipeController'
require './controllers/UserController'

require './models/UserModel'
require './models/RecipeModel'
require './models/RatingModel'

map ('/') {
  run ApplicationController
}

map ('/recipes') {
  run RecipeController
}

map ('/users') {
	run UserController
}