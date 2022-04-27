class Order
  attr_accessor :id
  attr_reader :customer, :meal, :employee
  def initialize(attributes = {})
    @customer = attributes[:customer] # instance de customer
    @meal = attributes[:meal] # instance de meal
    @employee = attributes[:employee] # instance d'employee
    @id = attributes[:id] # integer
    @delivered = attributes[:delivered] || false # boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_s
    "#{self.id} - #{self.delivered? ? "[X]" : "[ ]"} customer: #{self.customer.name} meal: #{self.meal.name} employee: #{self.employee.username}"
  end


end

# customer = Customer.new(...)
# meal = Meal.new(...)
# employee = Employee.new(...)

# first_order = Order.new(customer: customer , meal: meal, employee: employee)


# first_order.customer # => instance de customer

# first_order.customer.name
