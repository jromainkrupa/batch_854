class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.status? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{recipe.name}: #{recipe.description} preparation time: #{recipe.prep_time}, #{recipe.rating}/5"
    end
  end

  def ask_for(stuff)
    puts "#{stuff} ?"
    print "> "
    return gets.chomp
  end
end
