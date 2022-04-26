require_relative 'models/meal'
require_relative 'repositories/meal_repository'
require_relative 'controllers/meals_controller'
require_relative 'repositories/customer_repository'
require_relative 'controllers/customers_controller'
require_relative 'router'

meal = Meal.new(name: "Tourte", price: 12)

filepath1 = File.join('data/meals.csv')
filepath2 = File.join('data/customers.csv')

meal_repository = MealRepository.new(filepath1)
customer_repository = CustomerRepository.new(filepath2)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

Router.new(meals_controller, customers_controller).run
