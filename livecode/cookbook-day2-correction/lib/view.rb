class View
  def display(recipes) # expects array of recipes
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{recipe.status ? 'X' : ' '}] #{recipe.name}: #{recipe.description} | #{recipe.rating} / 5 | #{recipe.prep_time}"
    end
  end

  def ask_for(something)
    puts something
    print '> '
    gets.chomp
  end
end
