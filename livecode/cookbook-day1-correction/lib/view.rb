class View
  def display(recipes) # expects array of recipes
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for(something)
    puts something
    print '> '
    gets.chomp
  end
end
