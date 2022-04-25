require_relative "view"
require_relative "recipe"
require_relative "scraper_service"


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
    rating = @view.ask_for("reting")
    # 2. On crée une instance de Recipe
    recipe = Recipe.new(name: name, description: description, rating: rating)
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

  def import
    # 1. Demander le e mot clè au user (view)
    ingredient  = @view.ask_for("Which ingredient")
    # 2. scrap TODO
    # TODO
    recipes = ScraperService.new(ingredient).call

    # 3. On affiche les 5 recettes trouvées sur le web au user (View)
    @view.display_recipes(recipes)
    # 4. On demande au user (un numéro) de faire un choix parmi ces recettes (View)
    index = @view.ask_for("Which recipe would you like to import").to_i - 1
    recipe = recipes[index]
    # 5. On ajoute la recette choise au cookbook
    @cookbook.add(recipe)
  end

  def mark_recipe_as_done
    # 1. Afficher la liste
    recipes = @cookbook.all
    @view.display_recipes(recipes)
    # 2. demander l'index au user de la recette a marquer
    index = @view.ask_for("index").to_i - 1
    # 3. On choppe la recette
    recipe = recipes[index]
    # 4. on mark as done la recette (change le status)
    recipe.mark_recipe_as_done
    @cookbook.update
  end
end
