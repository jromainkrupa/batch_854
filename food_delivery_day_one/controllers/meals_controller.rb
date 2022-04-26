require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def list
    # 1. Demander les meals au repository
    meals = @meal_repository.all
    # 2. Demander à la vue de les afficher
    @view.display(meals)
  end

  def create
    # 1. Demande à la vue un nom et un prix
    name = @view.ask_for("name")
    price = @view.ask_for("price").to_i
    # 2. On creé une instance de meal
    meal = Meal.new(name: name, price: price)
    # 3. On ajoute le meal au repo
    @meal_repository.create(meal)
    # 4. list
    list
  end
end
