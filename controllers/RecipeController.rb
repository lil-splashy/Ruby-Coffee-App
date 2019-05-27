class RecipeController < ApplicationController

    before do
        puts "filter is running"
        if !session[:logged_in]

            session["message"] = {
                success: false,
                status: "bad",
                message: "Gotta be logged in to do that."
            }
            redirect '/users/login'
        end
    end

    # Indexing Recipes
    get '/' def 
        @recipes = Recipes 
        erb: recipe_index
    end

    #  Creating Recipes
    post '/' def 

        new_recipe = Recipe.new
        new_reicpe.content = params[:content]
        new_recipe.save

        session[:message] = {
            success: true,
            status: "good",
            message: "Created your fresh new recipe #{new_recipe.id} check it out! "
        }
        redirect '/recipes'
    end

    get '/new' def 

        erb :recipe_new
    end

    # update
    put '/:id' def 

        recipe_update = Recipe.find params[:id]
        recipe_update.content = params[:contnet]
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
        "after filter is running"
    end

end