require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_service'

class Controller
  def initialize(cookbook) # expected to be an instance of Cookbook
    @cookbook = cookbook
    @view = View.new
  end

  def list # TODO: display all the recipes in the cookbook
    # 1. get the recipes from cookbook (cookbook)
    recipes = @cookbook.all
    # 2. display them in terminal (view)
    @view.display(recipes)
  end

  def create
    # 1. ask for the name
    name = @view.ask_for('name')
    # 2. ask for description
    description = @view.ask_for('description')
    # 3. Ask user to rate the recipe
    rating = @view.ask_for('rate this out of 5')
    # 4. ask user for prep time
    prep_time = @view.ask_for("How long does it take to cook this?")
    # 4. instanciate recipe using the infomation above
    recipe = Recipe.new(name, description, rating, prep_time)
    # 5. save the new recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. display the recipes
    list
    # 2. ask for index
    index = @view.ask_for('number').to_i - 1
    # 3. remove the chosen recipe from the cookbook
    @cookbook.remove_recipe(index)
  end

  def import
    # 1. ask the user for the keyword
    keyword = @view.ask_for("Type the keyword for the recipe you want to import")
    # 2. open the html using the keywod
    results = ScrapeService.new(keyword).call
    # 5. display the 5 results
    @view.display(results)
    # 6. ask user for which one to import
    choice = @view.ask_for("Which recipe do you want to import (give number)").to_i - 1
    recipe = results[choice]
    # 7. save the chosen recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def mark_as_done
    # 1. display the list
    list
    # 2. ask the user for which recipe to mark
    choice = @view.ask_for("Which recipe do you want to mark (give number)").to_i - 1
    # 3. mark the chosen recipe
    @cookbook.mark_as_done(choice)
    # 4. save the updated state to cookbook <- this will be handled in mark_as_done method of Cookbook
  end
end
