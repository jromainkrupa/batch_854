class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for(stuff)
    puts "#{stuff} ?"
    print "> "
    return gets.chomp
  end
end
