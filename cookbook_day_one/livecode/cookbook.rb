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

  private

  def load_csv
    CSV.foreach(@filepath) do |row|
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      @recipes << recipe # recipe est une instance de recette
    end
  end

  def save_csv
    CSV.open(@filepath, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
