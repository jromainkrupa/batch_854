require_relative 'models/meal'
require_relative 'repositories/meal_repository'
require_relative 'controllers/meals_controller'
require_relative 'repositories/customer_repository'
require_relative 'controllers/customers_controller'
require_relative 'controllers/orders_controller'
require_relative 'repositories/employee_repository'
require_relative 'repositories/order_repository'
require_relative 'controllers/sessions_controller'
require_relative 'router'

meal = Meal.new(name: "Tourte", price: 12)

filepath1 = File.join('data/meals.csv')
filepath2 = File.join('data/customers.csv')
filepath3 = File.join('data/employees.csv')
filepath4 = File.join('data/orders.csv')

meal_repository = MealRepository.new(filepath1)
customer_repository = CustomerRepository.new(filepath2)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

employee_repository = EmployeeRepository.new(filepath3)
sessions_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(filepath4, customer_repository, meal_repository, employee_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)

Router.new(meals_controller, customers_controller, sessions_controller, orders_controller).run
