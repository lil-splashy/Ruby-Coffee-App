class RecipeController < ApplicationController

    before do
        puts "filter is running"
        if !session[:logged_in]

            session[:message] = {
                success: false,
                status: "bad",
                message: "Gotta be logged in to do that."
            }
            redirect '/users/login'
        end
    end

    # Indexing Recipes
    get '/' do 
        user = User.find_by({:username => session[:username]})
        @recipes = user.recipes

        erb :recipe_index
    end

    #  Creating Recipes
    post '/' do 

        new_recipe = Recipe.new
        new_recipe.drink_name = params[:drink_name]
        new_recipe.recipe = params[:recipe]

        logged_in_user = User.find_by({:username => session[:username]})
        new_item.user_id = logged_in_user.id
        new_recipe.save

        session[:message] = {
            success: true,
            status: "good",
            message: "Created your fresh new recipe #{new_recipe.id} check it out! "
        }
     
        redirect '/recipes'
    end
    # New Recipes  
    get '/new' do 

        erb :recipe_new
    end

    # update
    put '/:id' do 

        recipe_update = Recipe.find params[:id]
        recipe_update.drink_name = params[:drink_name]
        recipe_update.save

        session[:message] = {
            success: true,
            status: "good",
            message: "updated your recipe"
        }
        redirect '/recipes'
    end

    # destroy
    delete '/:id' do 
        recipe = Recipe.find params[:id]
        recipe.destroy

        session[:message] = {
            success: true,
            status: "good",
            message: "Successfully got rid of the recipe, sad to see it go..."
        }

        redirect '/recipes'
    end

    after do
       puts "after filter is running"
    end

end