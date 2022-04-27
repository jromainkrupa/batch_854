require_relative "./record_repository"
require_relative "../models/order"

class OrderRepository < RecordRepository

  def initialize(filepath, customer_repository, meal_repository, employee_repository)
    @customer_repository = customer_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    super(filepath)
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? == true }
  end

  def employee_undelivered_orders(employee)
    @elements.select { |order| employee.id == order.employee.id && order.delivered? == false }
  end

  private

  def row_to_record(row)
    id = row[:id].to_i
    customer = @customer_repository.find(row[:customer_id].to_i)
    meal = @meal_repository.find(row[:meal_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)
    delivered = row[:delivered] == "true"

    Order.new(
      id: id,
      customer: customer,
      meal: meal,
      employee: employee,
      delivered: delivered,
    )
  end

  def headers
    ["id", "meal_id", "customer_id", "employee_id", "delivered"]
  end

  def record_to_row(order)
    [order.id, order.meal.id, order.customer.id, order.employee.id, oder.delivered?]
  end

end
