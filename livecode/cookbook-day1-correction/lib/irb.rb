require_relative 'lib/recipe'
require_relative 'lib/cookbook'

csv_file   = File.join(__dir__, 'lib/recipes.csv')

cookbook = Cookbook.new(csv_file)

pizza = Recipe.new('pizza', 'cheese cheese cheese')

cookbook.add_recipe(pizza)
