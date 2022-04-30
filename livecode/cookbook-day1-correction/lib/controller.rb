require_relative 'view'
require_relative 'recipe'

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
    # 3. instanciate recipe using the infomation above
    recipe = Recipe.new(name, description)
    # 4. save the new recipe to the cookbook
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
end
