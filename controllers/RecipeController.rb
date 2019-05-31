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
        user = User.find_by({ :username => session[:username] })
        @recipe = user.recipes

        erb :recipe_index
    end

    get '/new' do 
        erb :recipe_new
    end
    #  Creating Recipes
    post '/new' do 

        new_recipe = Recipe.new
        new_recipe.drink_name = params[:drink_name]
        new_recipe.body = params[:body]
        logged_in_user = User.find_by({:username => session[:username]})
        new_recipe.user_id = logged_in_user.id
        new_recipe.save

        session[:message] = {
            success: true,
            status: "good",
            message: "Created your fresh new recipe ##{new_recipe.id} check it out! "
        }

        redirect '/recipes'
    end

    # New Recipes  
    

    # Show Recipes
    get '/recipes' do
        erb :recipes
    end
     # Edit Recipes
    get '/:id/edit' do
        @recipe = Recipe.find params[:id]
        erb :recipe_edit
    end

    # Update Recipes
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