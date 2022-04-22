require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. On demande au cookbook toutes les recipes
    recipes = @cookbook.all
    # 2. On demande à la view d'afficher nos recettes
    @view.display_recipes(recipes)
  end

  def create
    # 1. On demande au user le nom et la description de la recette
    name = @view.ask_for("Name")
    description = @view.ask_for("Description")
    # 2. On crée une instance de Recipe
    recipe = Recipe.new(name, description)
    # 3. On ajoute la recette au cookbook
    @cookbook.add(recipe)
    # 4. Réeafficher la liste de recettes
    list
  end

  def destroy
    # 1. Afficher la liste des recettes
    list
    # 2. Demander au user l'index de la recette à supprimer
    index = @view.ask_for("index").to_i - 1
    # 3. Supprimer la recette du cookbook avec son index
    @cookbook.remove_recipe(index)
    # 4. Réafficher la liste au user
  end
end
