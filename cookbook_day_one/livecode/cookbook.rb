require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(filepath)
    # TODO ???
    @recipes = [] # un tableau d'instances de Recipe
    @filepath = filepath
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe # => Instance de recette
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def update
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath) do |row|
      name = row[0]
      description = row[1]
      status = row[2] == "true"
      rating = row[3].to_f
      prep_time = row[4].to_i
      recipe = Recipe.new(name: name, description: description, status: status, rating: rating, prep_time: prep_time)
      @recipes << recipe # recipe est une instance de recette
    end
  end

  def save_csv
    CSV.open(@filepath, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.status?, recipe.rating, recipe.prep_time]
      end
    end
  end
end
