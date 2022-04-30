require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load
  end

  def all # TODO: return all the recipes in the cookbook
    @recipes
  end

  def add_recipe(recipe) # expects an instance of Recipe
    @recipes << recipe
    save
  end

  def remove_recipe(recipe_index) # expects an Integer
    @recipes.delete_at(recipe_index)
    save
  end

  def mark_as_done(recipe_index) # expects an Integer
    @recipes[recipe_index].done!
    save
  end

  private

  def load
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      rating = row[2]
      status = row[3] == 'true'
      prep_time = row[4]
      @recipes << Recipe.new(name, description, rating, status, prep_time)
    end
  end

  def save
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.status, recipe.prep_time]
      end
    end
  end
end
