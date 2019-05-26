require 'sinatra/base'



require './controllers/ApplicationController'
require './controllers/RecipeController'




require './models/RecipeModel'

map ('/') {
  run ApplicationController
}
map ('/recipes') {
  run RecipeController
}