require_relative "../views/orders_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
  end

  def list
    orders = @order_repository.all
    @orders_view.display(orders)
  end

  def add_order
    # 1. afficher les meals
    meals = @meal_repository.all
    @orders_view.display(meals)
    # 1. demander quel meal
    meal_id = @orders_view.ask_for("meal?").to_i
    meal = @meal_repository.find(meal_id)
    # 2. demander quel customer
    customers = @customer_repository.all
    @orders_view.display(customers)
    # 1. demander quel customer
    customer_id = @orders_view.ask_for("customer?").to_i
    customer = @customer_repository.find(customer_id)

    # 3. demander quel emplpoyee

    employees = @employee_repository.all
    @orders_view.display(employees)
    # 1. demander quel employee
    employee_id = @orders_view.ask_for("employee?").to_i
    employee = @employee_repository.find(employee_id)
    # 4. créer une oder

    Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    # 5. enregistrer dans l'order repo
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def my_list_undelivered_orders(employee)

    orders = @order_repository.employee_undelivered_orders(employee)

    @orders_view.display(orders)
  end
end
